//
//  UserManager.swift
//  MC4
//
//  Created by Marcelo Perassi on 13/12/21.
//

import CloudKit

struct JornadaManager {
    
    // MARK: - record types
    struct RecordType {
        static let Jornada = "Jornada"
    }
    
    // MARK: - errors
    enum CheckpointManagerError: Error, LocalizedError {
        case recordFailure
        case recordIDFailure
        case castFailure
        
        case cursorFailure
        
        public var errorDescription: String? {
            switch self {
            case .castFailure:
                return "Pontos não encontrados, mas foi encontrada uma inconsistência nos dados"
            default:
                return "Oooops... Erro interno."
            }
        }
    }
    
    // MARK: - saving to CloudKit
    static func save(jornada: Jornada, completion: @escaping (Result<Jornada, Error>) -> ()) {
        let record = CKRecord(recordType: RecordType.Jornada)
        
        record["nome"] = checkpoint.nome as CKRecordValue
        record["descricao"] = checkpoint.descricao as CKRecordValue
        
        let localizacoesReferences = jornada.checkpoints.map { checkpoint in
            if let id = checkpoint.id {
                return checkpoint.id
            }
            // TODO - Como resolver?
            CheckpointManager.save(checkpoint: checkpoint, completion: <#T##(Result<Checkpoint, Error>) -> ()#>)
        }
        
        record["checkpoints"] = checkpoint.localizacao as CKRecordValue
        
        CKContainer.default().publicCloudDatabase.save(record) { (record, err) in
            if let err = err {
                sendError(error: err, completion: completion)
                return
            }
            guard let record = record else {
                sendError(error: CheckpointManagerError.recordFailure, completion: completion)
                return
            }
            guard let checkpoint = Checkpoint.parse(record: record) else {
                sendError(error: CheckpointManagerError.castFailure, completion: completion)
                return
            }
            sendSuccess(checkpoint: checkpoint, completion: completion)
        }
    }
    
    // MARK: - fetching from CloudKit
    static func fetch(recordId: String, completion: @escaping (Result<Jornada, Error>) -> ()) {
        let pred = NSPredicate(format: "id == %@", recordId)
        let query = CKQuery(recordType: RecordType.Jornada, predicate: pred)
        
        CKContainer.default().publicCloudDatabase.fetch(withQuery: query) { results in
            do {
                let records = try results.get()
                if records.matchResults.count > 0 {
                    guard let record = try records.matchResults.first?.1.get() else {
                        sendError(error: CheckpointManagerError.recordFailure, completion: completion)
                        return
                    }
                    
                    guard let checkpoint = Checkpoint.parse(record: record) else {
                        sendError(error: CheckpointManagerError.castFailure, completion: completion)
                        return
                    }
                    sendSuccess(checkpoint: checkpoint, completion: completion)
                } else {
                    sendError(error: CheckpointManagerError.cursorFailure, completion: completion)
                }
            } catch {
                sendError(error: error, completion: completion)
            }
        }
    }
    
    // MARK: - delete from CloudKit
    static func delete(checkpoint: Checkpoint, completion: @escaping (Result<Jornada, Error>) -> ()) {
        let pred = NSPredicate(format: "id == %@", checkpoint.id)
        let query = CKQuery(recordType: RecordType.Jornada, predicate: pred)
        
        CKContainer.default().publicCloudDatabase.fetch(withQuery: query) { results in
            do {
                let records = try results.get()
                if records.matchResults.count > 0 {
                    guard let record = try records.matchResults.first?.1.get() else {
                        sendError(error: CheckpointManagerError.recordFailure, completion: completion)
                        return
                    }
                    CKContainer.default().publicCloudDatabase.delete(withRecordID: record.recordID) { recordID, err in
                        if let err = err {
                            sendError(error: err, completion: completion)
                            return
                        }
                        sendSuccess(checkpoint: checkpoint, completion: completion)
                    }
                } else {
                    sendError(error: CheckpointManagerError.cursorFailure, completion: completion)
                }
            } catch {
                sendError(error: error, completion: completion)
            }
        }
    }
    
    
    
    // MARK: - modify in CloudKit
    static func modify(checkpoint: Checkpoint, completion: @escaping (Result<Jornada, Error>) -> ()) {
        let pred = NSPredicate(format: "id == %@", checkpoint.id)
        let query = CKQuery(recordType: RecordType.Jornada, predicate: pred)
        
        CKContainer.default().publicCloudDatabase.fetch(withQuery: query) { results in
            do {
                let records = try results.get()
                if records.matchResults.count > 0 {
                    guard let record = try records.matchResults.first?.1.get() else {
                        sendError(error: CheckpointManagerError.recordFailure, completion: completion)
                        return
                    }
                    
                    record["nome"] = checkpoint.nome as CKRecordValue
                    record["descricao"] = checkpoint.descricao as CKRecordValue
                    record["localizacao"] = checkpoint.localizacao as CKRecordValue
                    
                    CKContainer.default().publicCloudDatabase.save(record) { (record, err) in
                        
                        if let err = err {
                            sendError(error: err, completion: completion)
                            return
                        }
                        guard let record = record else {
                            sendError(error: CheckpointManagerError.recordFailure, completion: completion)
                            return
                        }
                        
                        guard let checkpoint = Checkpoint.parse(record: record) else {
                            sendError(error: CheckpointManagerError.castFailure, completion: completion)
                            return
                        }
                        
                        sendSuccess(checkpoint: checkpoint, completion: completion)
                    }
                } else {
                    sendError(error: CheckpointManagerError.cursorFailure, completion: completion)
                }
            } catch {
                sendError(error: error, completion: completion)
            }
        }
    }
    
    static private func sendSuccess(jornada: Jornada, completion: @escaping (Result<Jornada, Error>) -> ()) {
        DispatchQueue.main.async {
            completion(.success(jornada))
        }
    }
    
    static private func sendError(error: Error, completion: @escaping (Result<Jornada, Error>) -> ()) {
        DispatchQueue.main.async {
            completion(.failure(error))
        }
    }
}


//
//  UserManager.swift
//  MC4
//
//  Created by Marcelo Perassi on 13/12/21.
//

import CloudKit

struct UserManager {
    
    // MARK: - record types
    struct RecordType {
        static let Users = "AppUsers"
    }
    
    // MARK: - errors
    enum UserManagerError: Error, LocalizedError {
        case recordFailure
        case recordIDFailure
        case castFailure
        case cursorFailure
        
        public var errorDescription: String? {
            switch self {
            case .castFailure:
                return "Usuário encontrado, mas foi encontrada uma inconsistência nos dados"
            default:
                return "Oooops... Erro interno."
            }
        }
    }
    
    // MARK: - saving to CloudKit
    static func save(user: User, completion: @escaping (Result<User, Error>) -> ()) {
        let userRecord = CKRecord(recordType: RecordType.Users)
        
        userRecord["id"] = user.id as CKRecordValue
        userRecord["email"] = user.email as CKRecordValue
        userRecord["firstName"] = user.firstName as CKRecordValue
        userRecord["lastName"] = user.lastName as CKRecordValue
        
        CKContainer.default().publicCloudDatabase.save(userRecord) { (record, err) in
            if let err = err {
                sendError(error: err, completion: completion)
                return
            }
            guard let record = record else {
                sendError(error: UserManagerError.recordFailure, completion: completion)
                return
            }
            guard let user = User.parse(record: record) else {
                sendError(error: UserManagerError.castFailure, completion: completion)
                return
            }
            sendSuccess(user: user, completion: completion)
        }
    }
    
    // MARK: - fetching from CloudKit
    static func fetch(userId: String, completion: @escaping (Result<User, Error>) -> ()) {
        let pred = NSPredicate(format: "id == %@", userId)
        let query = CKQuery(recordType: RecordType.Users, predicate: pred)
        
        CKContainer.default().publicCloudDatabase.fetch(withQuery: query) { results in
            do {
                let records = try results.get()
                if records.matchResults.count > 0 {
                    guard let record = try records.matchResults.first?.1.get() else {
                        sendError(error: UserManagerError.recordFailure, completion: completion)
                        return
                    }
                    
                    guard let user = User.parse(record: record) else {
                        sendError(error: UserManagerError.castFailure, completion: completion)
                        return
                    }
                    sendSuccess(user: user, completion: completion)
                } else {
                    sendError(error: UserManagerError.cursorFailure, completion: completion)
                }
            } catch {
                sendError(error: error, completion: completion)
            }
        }
    }
    
    // MARK: - delete from CloudKit
    static func delete(user: User, completion: @escaping (Result<User, Error>) -> ()) {
        let pred = NSPredicate(format: "id == %@", user.id)
        let query = CKQuery(recordType: RecordType.Users, predicate: pred)
        
        CKContainer.default().publicCloudDatabase.fetch(withQuery: query) { results in
            do {
                let records = try results.get()
                if records.matchResults.count > 0 {
                    guard let record = try records.matchResults.first?.1.get() else {
                        sendError(error: UserManagerError.recordFailure, completion: completion)
                        return
                    }
                    CKContainer.default().publicCloudDatabase.delete(withRecordID: record.recordID) { recordID, err in
                        if let err = err {
                            sendError(error: err, completion: completion)
                            return
                        }
                        sendSuccess(user: user, completion: completion)
                    }
                } else {
                    sendError(error: UserManagerError.cursorFailure, completion: completion)
                }
            } catch {
                sendError(error: error, completion: completion)
            }
        }
    }
    
    
    
    // MARK: - modify in CloudKit
    static func modify(user: User, completion: @escaping (Result<User, Error>) -> ()) {
        let pred = NSPredicate(format: "id == %@", user.id)
        let query = CKQuery(recordType: RecordType.Users, predicate: pred)
        
        CKContainer.default().publicCloudDatabase.fetch(withQuery: query) { results in
            do {
                let records = try results.get()
                if records.matchResults.count > 0 {
                    guard let record = try records.matchResults.first?.1.get() else {
                        sendError(error: UserManagerError.recordFailure, completion: completion)
                        return
                    }
                    
                    record["email"] = user.email as CKRecordValue
                    record["firstName"] = user.firstName as CKRecordValue
                    record["lastName"] = user.lastName as CKRecordValue
                    
                    CKContainer.default().publicCloudDatabase.save(record) { (record, err) in
                        
                        if let err = err {
                            sendError(error: err, completion: completion)
                            return
                        }
                        guard let record = record else {
                            sendError(error: UserManagerError.recordFailure, completion: completion)
                            return
                        }
                        
                        guard let user = User.parse(record: record) else {
                            sendError(error: UserManagerError.castFailure, completion: completion)
                            return
                        }
                        
                        sendSuccess(user: user, completion: completion)
                    }
                } else {
                    sendError(error: UserManagerError.cursorFailure, completion: completion)
                }
            } catch {
                sendError(error: error, completion: completion)
            }
        }
    }
    
    static private func sendSuccess(user: User, completion: @escaping (Result<User, Error>) -> ()) {
        DispatchQueue.main.async {
            completion(.success(user))
        }
    }
    
    static private func sendError(error: Error, completion: @escaping (Result<User, Error>) -> ()) {
        DispatchQueue.main.async {
            completion(.failure(error))
        }
    }
}


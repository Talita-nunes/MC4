//
//  Checkpoint.swift
//  MC4
//
//  Created by Joaquim P. Filho on 14/12/21.
//

import Foundation
import CloudKit

struct Checkpoint: Identifiable {
    var id: CKRecord.ID?
    var nome: String
    var descricao: String
    var localizacao: CLLocation
    
    static func parse(record: CKRecord) -> Checkpoint? {
        guard let nome = record["nome"] as? String,
              let descricao = record["descricao"] as? String,
              let localizacao = record["localizacao"] as? CLLocation else {
                  return nil
              }
        
        return Checkpoint(id: record.recordID, nome: nome, descricao: descricao, localizacao: localizacao)
    }
}

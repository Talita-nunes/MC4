//
//  ListElement.swift
//  MC4
//
//  Created by Marcelo Perassi on 13/12/21.
//

import SwiftUI
import CloudKit

struct Jornada: Identifiable {
    var id: CKRecord.ID
    var nome: String
    var descricao: String
    var checkpoints: [Checkpoint]
    
//    static func parse(record: CKRecord) -> Jornada? {
//        guard let nome = record["nome"] as? String,
//              let descricao = record["descricao"] as? String else {
//                  return nil
//              }
//
//
//        return Jornada(id: record.recordID, nome: nome, descricao: descricao, checkpoints: <#T##[CheckPoint]#>)
//    }
}

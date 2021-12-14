//
//  ListElement.swift
//  MC4
//
//  Created by Marcelo Perassi on 13/12/21.
//

import SwiftUI
import CloudKit

struct ListElement: Identifiable {
    var id = UUID()
    var recordID: CKRecord.ID?
    var text: String
}

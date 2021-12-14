//
//  ListElements.swift
//  MC4
//
//  Created by Marcelo Perassi on 13/12/21.
//

import SwiftUI

class ListElements: ObservableObject {
    @Published var items: [ListElement] = []
}


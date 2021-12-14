//
//  ContentView.swift
//  MC4
//
//  Created by Marcelo Perassi on 13/12/21.
//

import SwiftUI

struct JornadaContentView: View {
    
    @EnvironmentObject var listElements: ListElements
    @State private var newItem = ListElement(text: "")
    @State private var showEditTextField = false
    @State private var editedItem = ListElement(text: "")
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    HStack(spacing: 15) {
                        TextField("Adicionar Jornada", text: $newItem.text)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button("Adicionar") {
                            if !self.newItem.text.isEmpty {
                                let newItem = ListElement(text: self.newItem.text)
                                // MARK: - saving to CloudKit
                                CloudKitHelper.save(item: newItem) { (result) in
                                    switch result {
                                    case .success(let newItem):
                                        self.listElements.items.insert(newItem, at: 0)
                                        print("Successfully added item")
                                    case .failure(let err):
                                        print(err.localizedDescription)
                                    }
                                }
                                self.newItem = ListElement(text: "")
                            }
                        }
                    }
                    HStack(spacing: 15) {
                        TextField("Editar Item", text: self.$editedItem.text)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button("Ok") {
                            // MARK: - modify in CloudKit
                            CloudKitHelper.modify(item: self.editedItem) { (result) in
                                switch result {
                                case .success(let item):
                                    for i in 0..<self.listElements.items.count {
                                        let currentItem = self.listElements.items[i]
                                        if currentItem.recordID == item.recordID {
                                            self.listElements.items[i] = item
                                        }
                                    }
                                    self.showEditTextField = false
                                    print("Successfully modified item")
                                case .failure(let err):
                                    print(err.localizedDescription)
                                }
                            }
                        }
                    }
                    .frame(height: showEditTextField ? 60 : 0)
                    .opacity(showEditTextField ? 1 : 0)
                    .animation(.easeInOut)
                }
                .padding()
                Text("Duplo Click para editar. Pressionar para Deletar.")
                    .frame(height: showEditTextField ? 0 : 40)
                    .opacity(showEditTextField ? 0 : 1)
                    .animation(.easeInOut)
                List(listElements.items) { item in
                    HStack(spacing: 15) {
                        Text(item.text)
                    }
                    .onTapGesture(count: 2, perform: {
                        if !self.showEditTextField {
                            self.showEditTextField = true
                            self.editedItem = item
                        }
                    })
                        .onLongPressGesture {
                            if !self.showEditTextField {
                                guard let recordID = item.recordID else { return }
                                // MARK: - delete from CloudKit
                                CloudKitHelper.delete(recordID: recordID) { (result) in
                                    switch result {
                                    case .success(let recordID):
                                        self.listElements.items.removeAll { (listElement) -> Bool in
                                            return listElement.recordID == recordID
                                        }
                                        print("Successfully deleted item")
                                    case .failure(let err):
                                        print(err.localizedDescription)
                                    }
                                }
                                
                            }
                    }
                }
                .animation(.easeInOut)
            }
            .navigationBarTitle(Text("Cadastrar Jornada"))
        }
        .onAppear {
            // MARK: - fetch from CloudKit
            CloudKitHelper.fetch { (result) in
                switch result {
                case .success(let newItem):
                    self.listElements.items.append(newItem)
                    print("Successfully fetched item")
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
        }
    }
    
}

struct JornadaContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


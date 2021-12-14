//
//  Tela Inicio.swift
//  MC4
//
//  Created by Talita Nunes dos Santos on 07/12/21.
//


import SwiftUI

struct CelulaCriados: Identifiable{
    
    var id: Int
    let nomeCriados, fraseCriados, imagemCriados: String
}

struct CelulaParticipando: Identifiable{
    
    var id: Int
    let nomeParticipando, fraseParticipando, imagemParticipando: String
}



struct TelaInicioView: View {
    @State
    var showProfile: Bool = false
    
    let linhaCriados: [CelulaCriados] = [
        .init( id: 0, nomeCriados: "Desafio 1", fraseCriados: "Bora bora 1", imagemCriados: "Image1")
    ]
    
    let linhaParticipando:  [CelulaParticipando] = [
        .init( id: 0, nomeParticipando: "Desafio 1", fraseParticipando: "Bora bora 1", imagemParticipando: "Image1")
    ]
    
    init(){
        UITableView.appearance().backgroundColor = .white
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    // Section 01
                    Section(header: HStack{
                        Text("Criados")
                            .font(.system(size: 24, weight: .bold, design: .default))
                        Spacer()
                        Button(action: {}, label: {
                            Image(systemName: "plus")
                        })
                    }){
                        ForEach(linhaCriados, id: \.id){ user in
                            HStack{
                                Image("Image2")
                                    .resizable()
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                                    .frame(width: 70, height: 70)
                                VStack(alignment: .leading){
                                    Text(user.nomeCriados).font(.headline)
                                    Text(user.fraseCriados).font(.subheadline)
                                }.padding(.leading, 10)
                            }
                        }
                    }
                    
                    // Section 02
                    Section(header:HStack{
                        Text("Participando")
                            .font(.system(size: 24, weight: .bold, design: .default))
                        Spacer()
                        Button(action: {}, label: {
                            Image(systemName: "plus")
                        })
                    }){
                        ForEach(linhaParticipando, id: \.id){ user in
                            HStack{
                                Image("Image1")
                                    .resizable()
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                                    .frame(width: 70, height: 70)
                                VStack(alignment: .leading){
                                    Text(user.nomeParticipando).font(.headline)
                                    Text(user.fraseParticipando).font(.subheadline)
                                }.padding(.leading, 10)
                            }
                        }
                    }
                }
            }.toolbar(content: {
                ToolbarItem(placement: .principal){
                    HStack {
                        VStack{
                            Text ("Desafio")
                                .font(.system(size: 32, weight: .bold, design: .default))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                            Text ("Supere seus desafios 🏹")
                                .font(.system(size: 17, weight: .light, design: .default))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                        Spacer()
                        Button(action: {
                            self.showProfile.toggle()
                        }){
                            Image("Image3")
                                .resizable()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                                .frame(width: 50, height: 50)
                                .padding(.top, 10)
                        }.sheet(isPresented: $showProfile) {
                            let name = LoginManager.shared.settings?.user?.name() ?? ""
                            let email = LoginManager.shared.settings?.user?.email ?? ""
                            VStack {
                                Text("Nome: \(name)")
                                Text("E-mail: \(email)")
                                Button {
                                    LoginManager.shared.logout()
                                } label: {
                                    Text("Sair")
                                }
                            }
                        }

                    }
                }
            }).padding(.top, 20)
        }
    }
}


struct TelaInicioView_Previews: PreviewProvider {
    static var previews: some View {
        TelaInicioView()
    }
}

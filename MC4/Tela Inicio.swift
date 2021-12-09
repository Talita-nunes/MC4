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



struct TelaInicio: View {
    
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
            
            VStack{
                
                
                HStack{
                    Text("Criados")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .padding(.leading,
                                 20)
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "plus")
                    })
                    
                        .padding(.trailing, 20)
                }
                
                List(linhaCriados, id: \.id){ user in
                    
                    HStack{
                        Image("Image2")
                            .resizable()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                            .frame(width: 70, height: 70)
                        VStack(alignment: .leading){
                            
                            Text(user.nomeCriados).font(.headline)
                            Text(user.fraseCriados).font(.subheadline)
                        }.padding(.leading, 8)
                        
                    }

                }
               
                
                
                
                HStack{
                    Text("Participando")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .padding(.leading,
                                 20)
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "plus")
                    })
                        .padding(.trailing, 20)
                       
                }
                
                List(linhaParticipando, id: \.id){ user in
                    
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
                            .padding(.top, 2)
                        
                    }
                    

                }
            }
    

//            .navigationBarTitle("Desafio")
//            .navigationBarTitleDisplayMode(.large)
            
            .toolbar(content: {
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
                            
                        }.padding(.top, 20)
                        
                        Image("Image3")
                            .resizable()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                            .frame(width: 70, height: 70)
                            .padding(.top, 30)
                            .padding(.trailing, 15)
                    }
                    
                }
            })
        }
        .padding(.top, 20)
        
        
    }
    
}







struct TelaInicio_Previews: PreviewProvider {
    static var previews: some View {
        TelaInicio()
    }
}

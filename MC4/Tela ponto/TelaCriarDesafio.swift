//
//  TelaCriarDesafio.swift
//  MC4
//
//  Created by Talita Nunes dos Santos on 07/12/21.
//

import SwiftUI


struct CelulaPontos: Identifiable{
    
    var id: Int
    let pontoEscolhido, dicaDoPonto: String
}

struct CelulaPessoas: Identifiable{
    
    var id: Int
    let fotoPessoa,nomePessoa: String
    
}

struct TelaCriarDesafio: View {
    
    var nomeDesafio: String?
    var fraseDesafio: String?
    
    let linhaPontos: [CelulaPontos] = [
        .init( id: 0, pontoEscolhido: "Primeiro Ponto", dicaDoPonto: "Portão azul")
    ]
    
    let linhaPessoas: [CelulaPessoas] = [
        .init( id: 0, fotoPessoa: "Image4", nomePessoa: "Talita Santos")
    ]
    
    
    init(){
        UITableView.appearance().backgroundColor = .white
    }
    
    
    var body: some View {
        ZStack(alignment: Alignment.top){
            MapView()
            SlideOverCard {
                
                ScrollView {
                    VStack {
                        
                        HStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                Text("Excluir")
                            }
                            .font(.system(size: 17, weight: .light, design: .default))
                            .foregroundColor(.red)
                            .padding(.leading,
                                     2)
                            Spacer()
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                Text("Salvar")
                            }
                            .font(.system(size: 17, weight: .light, design: .default))
                            .foregroundColor(.blue)
                            .padding(.trailing, 20)

                            
//                                .padding(.trailing, 10)
                            
                        }
                        .padding(.leading)
                        
                        
                        VStack{
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .clipped()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                                .frame(width: 100, height: 100)
                                .padding(.top, 12)
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                Text("Adicionar foto")
                            }
                            .font(.system(size: 17, weight: .light, design: .default))
                            .foregroundColor(.blue)
                            .padding(.top,10)
                            
                            Text ("Nome do desafio")
                                .font(.system(size: 17, weight: .bold, design: .default))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding(.leading,
                                         20)
                                .padding(.top, 24)
                            
                            
                            TextField("Adicione o nome do desafio", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                .padding(.leading,
                                         20)
                                .background(.white)
                            
                            
                            Text ("Frase motivacional")
                                .font(.system(size: 17, weight: .light, design: .default))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding(.leading,
                                         20)
                                .padding(.top, 24)
                            
                            
                            TextField("Adicione uma frase motivacional", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                .padding(.leading,
                                         20)
                                .background(.white)
                            
                           
                            
                            Text ("Pontos")
                                .font(.system(size: 12, weight: .light, design: .default))
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding(.leading,
                                         20)
                                .padding(.top, 24)
                            
                            List(linhaPontos){ user in
                                
                                HStack{
                                    
                                    VStack{
                                        
                                        Text(user.pontoEscolhido)
                                            .font(.headline)
                                            .frame(maxWidth: .infinity, alignment: .topLeading)
                                        
                                        
                                        Text(user.dicaDoPonto)
                                            .font(.system(size: 12, weight: .light, design: .default))
                                            .frame(maxWidth: .infinity, alignment: .topLeading)
                                        
                                    }
                                    .padding(.trailing)
                                    
                                    
                                    
                                    Image(systemName: "checkmark.circle")
                                        .foregroundColor(.gray)
                                    
                                }                                .padding(.top,2)
                                
                            }
                            .frame(minHeight: 200,  maxHeight: .infinity)
                            
                            
                        }
                        
                        
                    }
                }
            }
        }
        
    }
}

struct TelaCriarDesafio_Previews: PreviewProvider {
    static var previews: some View {
        TelaCriarDesafio()
    }
}

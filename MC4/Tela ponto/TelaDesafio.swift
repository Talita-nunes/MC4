//
//  TelaDesafio.swift
//  MC4
//
//  Created by Talita Nunes dos Santos on 12/12/21.
//

import SwiftUI


struct TelaDesafio: View {
    
    
    var nomeDesafio: String?
    var fraseDesafio: String?
    
    let linhaPontos: [CelulaPontos] = [
        .init( id: 0, pontoEscolhido: "Primeiro Ponto", dicaDoPonto: "Portão azul")
    ]
    
    let linhaPessoas: [CelulaPessoas] = [
        .init( id: 0, fotoPessoa: "avatarUm", nomePessoa: "Talita Santos")]
    
    
    init(){
        UITableView.appearance().backgroundColor = .white
    }
    
    var body: some View {
        ZStack {
            TelaInicio()
            
            ScrollView {
                SlideOverCard {
                    
                    
                    ZStack {
                        
                        VStack{
                            HStack{
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                    Text("OK")
                                }
                                .font(.system(size: 17, weight: .light, design: .default))
                                .foregroundColor(.blue)
                                .padding(.trailing,
                                         2)
                                Spacer()
                            }
                        }
                        
                        VStack{
                            HStack {

                                
                                Image("Image2")
                                    .resizable()
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                                    .frame(width: 100, height: 100)
                                    .padding(.top, 15)
                                    .padding(.leading, 15)
                                
                                
                                VStack {
                                    Text ("Nome do Desafio")
                                        .font(.system(size: 32, weight: .bold, design: .default))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .topTrailing)
                                        .padding(.trailing, 10)
                                    
                                    
                                    
                                    Text ("Frase motivacional")
                                        .font(.system(size: 17, weight: .medium, design: .default))
                                        .foregroundColor(.gray)
                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                        .padding(.leading, 5)
                                    
                                }
                            }
                            
                            Text ("Pessoas")
                                .font(.system(size: 12, weight: .light, design: .default))
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding(.leading,
                                         20)
                                .padding(.top, 24)
                            
                            //                    lista de pessoas
                            ScrollView(.horizontal) {
                                HStack{
                                    
                                    VStack{
                                        
                                        Image("avatarUm")
                                            .resizable()
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                                            .frame(width: 50, height: 50)
                                            .padding(.top, 15)
                                            .padding(.leading, 15)
                                        
                                        Text("Nome da pessoa")
                                            .font(.system(size: 17, weight: .medium, design: .default))
                                            .foregroundColor(.gray)
                                            .frame(maxWidth: .infinity, alignment: .topLeading)
                                            .padding(.leading, 5)
                                    }
                                    
                                    
                                    
                                }
                            }
                            
                            
                            //                    lista de locais
                            
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



struct TelaDesafio_Previews: PreviewProvider {
    static var previews: some View {
        TelaDesafio()
    }
}

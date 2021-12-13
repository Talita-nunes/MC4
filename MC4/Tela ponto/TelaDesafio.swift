//
//  TelaDesafio.swift
//  MC4
//
//  Created by Talita Nunes dos Santos on 12/12/21.
//

import SwiftUI

struct TelaDesafio: View {
    var body: some View {
        ScrollView {
            ZStack {
                TelaInicio()
                SlideOverCard {
                    
                    
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
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding(.leading, 5)
                            
                        }
                    }
                    
                    
//                    lista de pessoas
                    List{
                        HStack{
                            
                            
                            
                        }
                    }
                    
//                    lista de locais
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


struct TelaDesafio_Previews: PreviewProvider {
    static var previews: some View {
        TelaDesafio()
    }
}

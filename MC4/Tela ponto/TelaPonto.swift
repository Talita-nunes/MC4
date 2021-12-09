//
//  TelaPonto.swift
//  MC4
//
//  Created by Talita Nunes dos Santos on 07/12/21.
//

import SwiftUI

struct TelaPonto : View {
    
    @State
    var titulo: String = "Biblioteca Mackenzie"
    var subtitulo: String = "Prédio 2"
    var body: some View {
        ZStack(alignment: Alignment.top) {
            
            MapView()
            SlideOverCard {
                ScrollView {
                    VStack {
                        HStack{
                            
                            TextField("Escreva um ponto", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                .padding(.leading,
                                         20)
                            
                            Image("Image3")
                                .resizable()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                                .frame(width: 30, height: 30)
                            
                                .padding(.top, 4)
                                .padding(.trailing, 20)
                        }
                        
                        Text(titulo)
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .foregroundColor(.black)
                        
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(.leading,
                                     20)
                            .padding(.top, 30)
                        
                        Text(subtitulo)
                            .font(.system(size: 17, weight: .light, design: .default))
                            .foregroundColor(.black)
                            .padding(.leading,
                                     20)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        HStack{
                            Text("Dica")
                                .font(.system(size: 17, weight: .light, design: .default))
                                .padding(.leading,
                                         20)
                            Spacer()
                            Button(action: {}, label: {
                                Image(systemName: "plus")
                            })
                                .padding(.trailing, 20)

                                .padding(.top, 30)

                            
                            
                        }
                        
                        VStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                
                                HStack{
                                    Text("Adicionar ponto")
                                        .frame(width: 200, height: 50)

                                }
                             }
                            .font(.system(size: 17, weight: .light, design: .default))
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(10)
                            .padding(.top,100)
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                HStack{
                                    Text("Concluir")
                                        .frame(width: 200, height: 50)
                                }
                               
                            }
                            .font(.system(size: 17, weight: .light, design: .default))
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(10)
                            .padding(.top,10)
                            
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.vertical)
        }
    }
}


struct TelaPonto_Previews: PreviewProvider {
    static var previews: some View {
        TelaPonto()
    }
}

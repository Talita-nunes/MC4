//
//  CodigoDesafio.swift
//  MC4
//
//  Created by Talita Nunes dos Santos on 09/12/21.
//

import SwiftUI

struct CodigoDesafio: View {
    var body: some View {
        ZStack(alignment: Alignment.top){
            TelaInicioView()
            SlideOverCard {
                ZStack {
                    VStack {
                        
                        HStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                Text("OK")
                            }
                            .font(.system(size: 17, weight: .light, design: .default))
                            .foregroundColor(.blue)
                            .padding(.leading,
                                     20)
                            Spacer()
                        }
                        
                        VStack{
                            Image("Image3")
                                .resizable()
                                .clipped()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                                .frame(width: 100, height: 100)
                                .padding(.top, 12)
                            
                            
                            Text("Nome do Desafio")
                                .font(.system(size: 32, weight: .bold, design: .default))
                                .foregroundColor(.black)
                                .padding(.top,10)
                        }
                        
                        
                        Text ("Código do desafio")
                            .font(.system(size: 20, weight: .medium, design: .default))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(.leading,
                                     20)
                            .padding(.top, 40)
                       
               
                        Text ("código do desafio")

                            .font(.system(size: 17, weight: .light, design: .default))
                            .foregroundColor(.gray)
                        
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(.leading, 130)
                            .padding(.top, 10)
                        
                        
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            HStack{
                                Text("Copiar link")
                                    .frame(width: 200, height: 50)
                            }
                            
                        }
                        .font(.system(size: 17, weight: .light, design: .default))
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                        .padding(.top,60)
                        
                    }
                    
                    
                    
                }
                
            }
            .edgesIgnoringSafeArea(.vertical)
            
        }  ;  }
}

struct CodigoDesafio_Previews: PreviewProvider {
    static var previews: some View {
        CodigoDesafio()
    }
}

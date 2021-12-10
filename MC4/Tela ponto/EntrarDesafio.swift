//
//  EntrarDesafio.swift
//  MC4
//
//  Created by Talita Nunes dos Santos on 09/12/21.
//

import SwiftUI

struct EntrarDesafio: View {
    var body: some View {
        ZStack(alignment: Alignment.top){
            MapView()
            SlideOverCard {
                ZStack {
                    VStack {
                        
                        HStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                Text("Cancelar")
                            }
                            .font(.system(size: 17, weight: .light, design: .default))
                            .foregroundColor(.red)
                            .padding(.leading,
                                     10)
                            Spacer()
                        }
                        
                        
                        Text ("Entre em um desafio")
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(.leading,
                                     20)
                            .padding(.top, 40)
                        
                        TextField("Insira aqui o código do desafio", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .padding(.leading,
                                     20)
                            .background(.white)
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            HStack{
                                Text("Começar")
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
            
        }
    }
    
}

struct EntrarDesafio_Previews: PreviewProvider {
    static var previews: some View {
        EntrarDesafio()
    }
}


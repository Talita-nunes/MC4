//
//  ConfirmarPonto.swift
//  MC4
//
//  Created by Talita Nunes dos Santos on 13/12/21.
//

import SwiftUI

struct ConfirmarPonto: View {
    var body: some View {
        ZStack(alignment: Alignment.top){
            TelaDesafio()
            SlideOverCard {
                ZStack {
                    VStack {
                        
                        
                        Text ("Confirmar ponto")
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(.leading,
                                     20)
                            .padding(.top, 40)
                        
                        Text ("Parabéns, você chegou em um dos pontos")
                            .font(.system(size: 17, weight: .medium, design: .default))
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(.leading, 20)
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            HStack{
                                Text("Confirmar")
                                    .frame(width: 200, height: 50)
                            }
                            
                        }
                        .font(.system(size: 17, weight: .light, design: .default))
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                        .padding(.top,80)
                        
                    }
                    
                    

                }
                
            }
            .edgesIgnoringSafeArea(.vertical)
            
        }
    }
}

struct ConfirmarPonto_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmarPonto()
    }
}

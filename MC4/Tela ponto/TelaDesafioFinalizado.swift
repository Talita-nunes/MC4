//
//  TelaDesafioFinalizado.swift
//  MC4
//
//  Created by Talita Nunes dos Santos on 13/12/21.
//

import SwiftUI

struct TelaDesafioFinalizado: View {
    var body: some View {
        
        
        ZStack(alignment: Alignment.top){
            TelaDesafio()
            SlideOverCard {
                ScrollView {
                    VStack{
                        
                        
                        Image("confetti")
                            .resizable()
                            .clipped()
                            .frame(width: 200, height: 200)
                            .padding(.top)
                            .padding(.leading, 20)
                        
                        
                        
                        Text("Parabéns você completou o desafio")
                            .font(.system(size: 17, weight: .bold, design: .default))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(.top, 50)
                            .padding(.leading, 50)
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

struct TelaDesafioFinalizado_Previews: PreviewProvider {
    static var previews: some View {
        TelaDesafioFinalizado()
    }
}

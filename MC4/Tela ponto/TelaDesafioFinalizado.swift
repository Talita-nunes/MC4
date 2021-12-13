//
//  TelaDesafioFinalizado.swift
//  MC4
//
//  Created by Talita Nunes dos Santos on 13/12/21.
//

import SwiftUI

struct TelaDesafioFinalizado: View {
    var body: some View {
        
        
        ZStack {
            TelaDesafio()
            SlideOverCard {
                VStack{
                    
                    Image("confetti.png")
                        .resizable()
                        .clipped()
                        .padding()
                    
                    
                    Text("Parabéns você completou o desafio")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.top)
                    
                    Spacer()
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

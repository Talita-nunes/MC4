//
//  Inicial.swift
//  MC4
//
//  Created by Talita Nunes dos Santos on 13/12/21.
//

import SwiftUI

struct Inicial: View {
    var body: some View {
        ZStack{
           Image("image3")
                .ignoresSafeArea()
            
            HStack{
                
                Rectangle()
                    .background(.gray)
                    .frame(width: 50, height: 50)
                
                VStack{
                    Text("Nome do desafio")
                        .font(.system(size: 17, weight: .bold, design: .default))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .topTrailing)
                        .padding(.trailing, 10)
                    
                    
                    
                    Text ("Frase motivacional")
                        .font(.system(size: 12, weight: .medium, design: .default))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.leading, 5)
                }
                             
            }
        }
    }
}

struct Inicial_Previews: PreviewProvider {
    static var previews: some View {
        Inicial()
    }
}

//
//  CadastroPontos.swift
//  MC4
//
//  Created by Marcelo Perassi on 02/12/21.
//

import SwiftUI

struct CadastroPontosContentView: View {
    @State var nomeponto = ""
    @State var dica = ""
    @State var latitude = ""
    @State var longitude = ""
    
    
    
    var body: some View {
        NavigationView {
    
            
                
//                Image("logo").resizable()
//                    .scaledToFit()
//                    .frame(width: 150, height: 150)
//
               
                
                VStack {
                    
                  
                    TextField("Nome do Ponto", text: $nomeponto)
                        .background(Color(.secondarySystemBackground))
                        .padding()
                    
                    TextField("Dica", text: $dica)
                        .background(Color(.secondarySystemBackground))
                        .padding()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Cadastrar")
                        .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Cadastrar")
                        .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                    })
                    
                    
                }
                .padding()
                
                //Spacer()
                .navigationTitle("Cadastro do Ponto")
            }
            
        }
    }
    
    
    
    


struct CadastroPontosContentView_Previews: PreviewProvider {
    static var previews: some View {
        CadastroPontosContentView()
            .preferredColorScheme(.light)
    }
}



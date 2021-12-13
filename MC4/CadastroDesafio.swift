//
//  CadastroDesafio.swift
//  MC4
//
//  Created by Marcelo Perassi on 02/12/21.
//

import SwiftUI

struct CadastroDesafioContentView: View {
    @State var nomejornada = ""
    @State var capa = ""
    @State var pessoas = ""
    @State var frasemotivacional = ""
    
    
    
    var body: some View {
        NavigationView {
    
            
                
//                Image("logo").resizable()
//                    .scaledToFit()
//                    .frame(width: 150, height: 150)
//
               
                
                VStack {
                    
                  
                    TextField("Nome do Desafio", text: $nomejornada)
                        .background(Color(.secondarySystemBackground))
                        .padding()
                    
                    SecureField("Premiacao", text: $capa)
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
                    
                    
                }
                .padding()
                
                //Spacer()
                .navigationTitle("Cadastro do Desafio")
            }
            
        }
    }
    
    
    
    


struct CadastroDesafioContentView_Previews: PreviewProvider {
    static var previews: some View {
        CadastroDesafioContentView()
            .preferredColorScheme(.light)
    }
}


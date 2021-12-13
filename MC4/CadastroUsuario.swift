//
//  CadastroUsuario.swift
//  MC4
//
//  Created by Marcelo Perassi on 02/12/21.
//

import SwiftUI

struct CadastroUsuarioContentView: View {
    @State var email = ""
    @State var password = ""
    @State var nome = ""
    @State var imagem = ""
    
    
    
    var body: some View {
        NavigationView {
    
            
                
//                Image("logo").resizable()
//                    .scaledToFit()
//                    .frame(width: 150, height: 150)
//
               
                
                VStack {
                    
                  
                    TextField("Email", text: $email)
                        .background(Color(.secondarySystemBackground))
                        .padding()
                    
                    SecureField("Senha", text: $email)
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
                .navigationTitle("Cadastro do Usuário")
            }
            
        }
    }
    
    
    
    


struct CadastroUsuarioContentView_Previews: PreviewProvider {
    static var previews: some View {
        CadastroUsuarioContentView()
            .preferredColorScheme(.light)
    }
}


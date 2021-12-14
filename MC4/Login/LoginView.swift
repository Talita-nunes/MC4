//
//  LoginView.swift
//  MC4
//
//  Created by Marcelo Perassi on 13/12/21.
//

import SwiftUI
import Combine

struct LoginView: View {
    @EnvironmentObject
    var loginSetting: LoginSettings
    @State
    var errorMessage: String?
    
    var body: some View {
        VStack {
            Text("Bem-vindo")
                .padding()
            Text("Faça Login para Entrar")
                .padding()
            if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .fontWeight(.thin)
                    .padding()
            }
            
            QuickSignInWithApple()
                .frame(width: 280, height: 60, alignment: .center)
                .onTapGesture(perform: showAppleLoginView)
            Spacer()
        }
    }
    
    private func showAppleLoginView() {
        LoginManager.shared.signInWithApple(completionHandler: { result in
            do {
                // Ignora a resposta, mas testa se o
                // metodo de login funcionou, caso tenha
                // erro o fluxo será direcionado ao catch
                let _ = try result.get()
                loginSetting.loggedIn = true
            } catch {
                self.errorMessage = error.localizedDescription
                loginSetting.loggedIn = false
            }
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(LoginSettings())
    }
}

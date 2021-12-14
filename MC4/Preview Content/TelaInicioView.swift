//
//  TelaInicioView.swift
//  MC4
//
//  Created by Marcelo Perassi on 13/12/21.
//

import SwiftUI

struct TelaInicioView: View {
    @State
    var user: User?
    @EnvironmentObject
    var loginSettings: LoginSettings
    
    var body: some View {
        VStack {
            Text("Aeeee")
            Text(loginSettings.user?.debugDescription ?? "Sem dados")
            Button {
                LoginManager.shared.logout()
            } label: {
                Text("Sair")
            }
            Button {
                LoginManager.shared.delete { result in
                    do {
                        let _ = try result.get()
                        LoginManager.shared.logout()
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Apagar meus dados")
                    .foregroundColor(.red)
                    .fontWeight(.thin)
            }

        }
    }
}

struct TelaInicioView_Previews: PreviewProvider {
    static var previews: some View {
        TelaInicioView()
    }
}

//
//  PrincipalView.swift
//  MC4
//
//  Created by Marcelo Perassi on 13/12/21.
//

import SwiftUI

struct PrincipalView: View {
    @EnvironmentObject
    var loginSettings: LoginSettings
    
    var body: some View {
        if loginSettings.loggedIn {
            TelaInicioView()
        } else {
            LoginView()
        }
    }
}

struct PrincipalView_Previews: PreviewProvider {
    static let loginSettings = LoginSettings()
    static var previews: some View {
        PrincipalView().environmentObject(loginSettings)
    }
}


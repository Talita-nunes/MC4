//
//  MC4App.swift
//  MC4
//
//  Created by Talita Nunes dos Santos on 12/11/21.
//

import SwiftUI

@main
struct MC4App: App {
    private let loginSettings: LoginSettings = LoginSettings()
    var body: some Scene {
        WindowGroup {
//            MainView().environmentObject(loginSettings)
            TelaInicioView()
        }
    }
}

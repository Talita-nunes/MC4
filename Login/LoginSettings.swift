//
//  LoginSettings.swift
//  MC4
//
//  Created by Marcelo Perassi on 13/12/21.
//

import Foundation
import Combine

class LoginSettings: ObservableObject {
    @Published
    var loggedIn: Bool = false
    @Published
    var user: User?
}

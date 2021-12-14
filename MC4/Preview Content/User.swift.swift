//
//  User.swift.swift
//  MC4
//
//  Created by Marcelo Perassi on 13/12/21.
//

import Foundation
import AuthenticationServices
import CloudKit

struct User: Identifiable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let avatar: String = ""
    let recordID: CKRecord.ID?
    
    static func parse(credentials: ASAuthorizationAppleIDCredential) -> User {
        let id = credentials.user
        let firstName = credentials.fullName?.givenName ?? ""
        let lastName = credentials.fullName?.familyName ?? ""
        let email = credentials.email ?? ""
        return User(id: id, firstName: firstName, lastName: lastName, email: email, recordID: nil)
    }
    
    static func parse(record: CKRecord) -> User? {
        guard let id = record["id"] as? String,
              let firstName = record["firstName"] as? String,
              let lastName = record["lastName"] as? String,
              let email = record["email"] as? String else {
                  return nil
              }
        return User(id: id, firstName: firstName, lastName: lastName, email: email, recordID: record.recordID)
    }
}

extension User: CustomDebugStringConvertible {
    var debugDescription: String {
        return """
        ID: \(id)
        First Name: \(firstName)
        Last Name: \(lastName)
        Email: \(email)
        """
    }
}

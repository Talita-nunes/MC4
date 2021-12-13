//
//  ErrorResponse.swift
//  MC4
//
//  Created by Marcelo Perassi on 06/12/21.
//

import Foundation

struct ErrorResponse: Decodable, LocalizedError {
    let reason: String
    
    var errorDescription: String? { return reason }
    
    
}


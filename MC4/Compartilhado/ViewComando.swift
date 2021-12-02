//
//  ViewComando.swift
//  MC4
//
//  Created by Talita Nunes dos Santos on 23/11/21.
//

import SwiftUI

struct ViewComando: View {
    var body: some View {
        #if APPCLIP
        Text ("AppClip")
        #else
        Text("Inicial")
        #endif
    }
    
}

struct ViewComando_Previews: PreviewProvider {
    static var previews: some View {
        ViewComando()
    }
}

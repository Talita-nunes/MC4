//
//  Handle.swift
//  MC4
//
//  Created by Talita Nunes dos Santos on 07/12/21.
//

import SwiftUI

struct Handle : View {
    private let handleThickness = CGFloat(5.0)
    var body: some View {
        RoundedRectangle(cornerRadius: handleThickness / 2.0)
            .frame(width: 40, height: handleThickness)
            .foregroundColor(Color.secondary)
            .padding(5)
    }
}

struct Handle_Previews: PreviewProvider {
    static var previews: some View {
        Handle()
    }
}


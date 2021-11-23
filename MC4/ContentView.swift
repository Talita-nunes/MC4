//
//  ContentView.swift
//  MC4
//
//  Created by Talita Nunes dos Santos on 12/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            InicialView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Inicial")
                }
            DesafiosView()
                .tabItem{
                    Image(systemName: "figure.walk")
                    Text("Desafios")
                }
            
            CalendarioView()
                .tabItem{
                    Image(systemName: "calendar")
                    Text("Calendário")
                    
                }
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

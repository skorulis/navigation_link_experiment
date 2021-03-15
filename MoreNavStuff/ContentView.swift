//
//  ContentView.swift
//  MoreNavStuff
//
//  Created by Alexander Skorulis on 15/3/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var coordinator = NavCoordinator()
    
    var body: some View {
        CustomNavView(coordinator: coordinator)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

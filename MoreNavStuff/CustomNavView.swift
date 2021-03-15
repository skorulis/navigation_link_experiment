//
//  CustomNavView.swift
//  MoreNavStuff
//
//  Created by Alexander Skorulis on 15/3/21.
//

import Foundation
import SwiftUI

// MARK: - Memory footprint

struct CustomNavView {
    
    @ObservedObject var coordinator: NavCoordinator
    
    init(coordinator: NavCoordinator) {
        self.coordinator = coordinator
    }
    
}

// MARK: - Rendering

extension CustomNavView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                pageView(.page1)
                links()
            }
        }
        EmptyView()
    }
    
    func pageView(_ route: NavRoute) -> some View {
        VStack {
            Text("Here is the page: \(route.rawValue)")
        }
    }
    
    func links() -> some View{
        ForEach(NavRoute.allCases) { route in
            NavigationLink(
                destination: LazyView(self.pageView(route)),
                label: {
                    Text("Navigate \(route.rawValue)")
                })
        }
        
    }
}

// MARK: - Previews

struct CustomNavView_Previews: PreviewProvider {
    
    static var previews: some View {
        let coordinator = NavCoordinator()
        CustomNavView(coordinator: coordinator)
    }
}


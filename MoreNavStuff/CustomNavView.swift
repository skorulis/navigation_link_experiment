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
                
            }
        }
        EmptyView()
    }
    
    func pageView(_ route: NavRoute) -> AnyView {
        switch route {
        case .page1:
            return AnyView(
            VStack {
                Text("Page1")
                Button(action: {
                    coordinator.push(.page2)
                }, label: {
                    Text("Page2")
                })
                NavigationLink(item: coordinator.routeBinding(.page2), destination: pageView)
            }
            )
        case .page2:
            return AnyView(
            VStack {
                Text("Page2")
                Button(action: {
                    coordinator.push(.page3)
                }, label: {
                    Text("Page3")
                })
                NavigationLink(item: coordinator.routeBinding(.page3), destination: pageView)
            }
            )
        case .page3:
            return AnyView(
            VStack {
                Text("Page3")
                Button(action: {
                    coordinator.push(.page4)
                }, label: {
                    Text("Page4")
                })
                NavigationLink(item: coordinator.routeBinding(.page4), destination: pageView)
            }
            )
        case .page4:
            return AnyView(
            VStack {
                Text("Page4")
                Button(action: {
                    coordinator.push(.page5)
                }, label: {
                    Text("Page5")
                })
                NavigationLink(item: coordinator.routeBinding(.page5), destination: pageView)
            }
            )
        default:
            return AnyView(
            VStack {
                Text("Here is the page: \(route.rawValue)")
            }
            )
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


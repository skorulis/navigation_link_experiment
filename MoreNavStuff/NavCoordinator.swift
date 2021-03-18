//
//  NavCoordinator.swift
//  MoreNavStuff
//
//  Created by Alexander Skorulis on 15/3/21.
//

import Foundation
import SwiftUI

enum NavRoute: String, Identifiable, CaseIterable {
    
    case page1
    case page2
    case page3
    case page4
    case page5
    case page6
    
    
    var id: String {
        return self.rawValue
    }
    
    var next: NavRoute {
        let all = NavRoute.allCases
        let current = all.firstIndex(of: self) ?? 0
        return  all[current + 1]
    }
}

final class NavCoordinator: ObservableObject {
    
    @Published var stack: [NavRoute] = [.page1]
    
    func push(_ route: NavRoute) {
        stack.append(route)
        print(stack)
    }
    
    func pop() {
        if stack.count > 1 {
            _ = stack.popLast()
        }
    }
    
    func remove2() {
        stack = stack.filter { $0.id != NavRoute.page2.id }
        print(stack)
    }
    
    func remove3() {
        stack = stack.filter { $0.id != NavRoute.page3.id }
    }
    
    func routeBinding(_ route: NavRoute) -> Binding<NavRoute?> {
        return Binding<NavRoute?> { () -> NavRoute? in
            return self.stack.first(where: {$0.id == route.id})
        } set: { (x, _) in
            if x == nil {
                self.stack.removeAll(where: {$0.id == route.id })
            }
        }

    }
    
}

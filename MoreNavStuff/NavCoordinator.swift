//
//  NavCoordinator.swift
//  MoreNavStuff
//
//  Created by Alexander Skorulis on 15/3/21.
//

import Foundation

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
    
    func push() {
        stack.append(stack.last!.next)
    }
    
    func pop() {
        if stack.count > 1 {
            _ = stack.popLast()
        }
    }
    
}

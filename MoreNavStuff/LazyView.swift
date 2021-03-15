//
//  LazyView.swift
//  MoreNavStuff
//
//  Created by Alexander Skorulis on 15/3/21.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}

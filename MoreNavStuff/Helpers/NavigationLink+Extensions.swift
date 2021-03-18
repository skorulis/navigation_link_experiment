//
//  NavigationLink+Extensions.swift
//  MoreNavStuff
//
//  Created by Alexander Skorulis on 15/3/21.
//

import SwiftUI

extension NavigationLink where Label == EmptyView {
  public init?<V: Identifiable>(
    item: Binding<V?>,
    destination: @escaping (V) -> Destination
  ) {
    if let value = item.wrappedValue {
      let isActive: Binding<Bool> = Binding(
        get: { item.wrappedValue != nil },
        set: { value in
          // There's shouldn't be a way for SwiftUI to set `true` here.
          if !value {
            item.wrappedValue = nil
          }
        }
      )

      self.init(
        destination: destination(value),
        isActive: isActive,
        label: { EmptyView() }
      )
    } else {
      return nil
    }
  }
}

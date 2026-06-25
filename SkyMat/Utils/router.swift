//
//  router.swift
//  SkyMat
//
//  Created by Antoneos Philip on 23/06/2026.
//

import Foundation
import SwiftUI
public import Combine

final class Router: ObservableObject {
    @Published var path = NavigationPath()

    func navigate(to route: Route) {
        path.append(route)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path = NavigationPath()
    }
}

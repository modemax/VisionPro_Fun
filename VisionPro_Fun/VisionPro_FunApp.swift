//
//  VisionPro_FunApp.swift
//  VisionPro_Fun
//
//  Created by Christopher Reese on 8/30/23.
//

import SwiftUI

@main
struct VisionPro_FunApp: App {
    @State private var currentStyle: ImmersionStyle = .progressive

    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
                .preferredSurroundingsEffect(.systemDark)
        }
        .immersionStyle(selection: $currentStyle, in: .mixed, .progressive, .full)
    }
}

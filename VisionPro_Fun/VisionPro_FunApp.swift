//
//  VisionPro_FunApp.swift
//  VisionPro_Fun
//
//  Created by Christopher Reese on 8/30/23.
//

import SwiftUI

@main
struct VisionPro_FunApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}

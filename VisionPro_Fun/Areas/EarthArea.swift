//
//  EarthArea.swift
//  VisionPro_Fun
//
//  Created by Christopher Reese on 10/9/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct EarthArea: View {
    var body: some View {
        VStack {
            Model3D(named: "Earth", bundle: realityKitContentBundle) { model in
                model
                    //.resizable()
                    //.aspectRatio(contentMode: .fit)
                    .scaledToFit()
                    .scaleEffect(0.8)
                    .phaseAnimator([false, true]) { model, rotateXY in
                        model
                            .rotation3DEffect(.degrees(rotateXY ? 720 : 0), axis: (x: 5, y: 5, z: rotateXY ? -15 : 15))
                    } animation: { rotateXY in
                            .easeInOut(duration: 8).repeatForever(autoreverses: false)
                    }
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview {
    EarthArea()
}

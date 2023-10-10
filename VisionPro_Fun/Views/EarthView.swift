//
//  EarthView.swift
//  VisionPro_Fun
//
//  Created by Christopher Reese on 10/9/23.
//

import SwiftUI
import RealityKit
import RealityKitContent


struct EarthView: View {
    @State var rotationA: Angle = .zero
    @State var rotationB: Angle = .zero
    @State var earthEntity = Entity()

    var body: some View {
        RealityView { content in
            guard let entity = try? await Entity(named: "Scene", in: realityKitContentBundle) else {
                fatalError("Unable to load ImmersiveView Entity")
            }
            content.add(entity)
        } update: { content in
            if let scene = content.entities.first {
                Task {
                    earthEntity = scene.findEntity(named: "Earth") ?? Entity()
                }
            }
        }
        .gesture(
            DragGesture()
                .targetedToAnyEntity()
                .onChanged { _ in
                    rotationA.degrees += 5.0
                    let m1 = Transform(pitch: Float(rotationA.radians)).matrix
                    let m2 = Transform(yaw: Float(rotationA.radians)).matrix
                    earthEntity.transform.matrix = matrix_multiply(m1, m2)
                    // Keep starting distance between models
                    //entity.position.x = -0.25
                }
        )
    }
}

#Preview {
    EarthView()
}

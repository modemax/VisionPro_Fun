//
//  ContentDetailView.swift
//  VisionPro_Fun
//
//  Created by Christopher Reese on 10/3/23.
//


import SwiftUI
import RealityKit
import RealityKitContent

struct ContentDetailView: View {
    let contentName: String
    
    var body: some View {
        VStack {
            Model3D(named: contentName, bundle: realityKitContentBundle) { model in
                model
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 500, height: 500)
            } placeholder: {
                ProgressView()
            }
        }
        .navigationTitle(contentName.capitalized)
        .padding()
    }
}

#Preview {
    ContentDetailView(contentName: "Earth")
}

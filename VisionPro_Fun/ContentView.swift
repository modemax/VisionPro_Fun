//
//  ContentView.swift
//  VisionPro_Fun
//
//  Created by Christopher Reese on 8/30/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ARContentInfo: Identifiable {
    var id = UUID()
    var entityName: String
    var immersiveSpaceFlag: Bool
}


struct ContentView: View {

    @State private var selectedARContentName: String = "Earth"

    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        let arContentList: [ARContentInfo] = [
            ARContentInfo(entityName: "Earth", immersiveSpaceFlag: false),
            ARContentInfo(entityName: "Immersive", immersiveSpaceFlag: true)
        ]
        VStack {
            NavigationSplitView {
                List(arContentList) { arContentItem in
                    Text(arContentItem.entityName)
                        .onTapGesture {
                            selectedARContentName = arContentItem.entityName
                        }
                        .listRowBackground(selectedARContentName == arContentItem.entityName ? Color.gray : Color.clear)
                }
                .navigationTitle("🏆 AR Experiences")
            } detail: {
                ContentDetailView(contentName: selectedARContentName)
            }
            
            Toggle("Show Immersive Space", isOn: $showImmersiveSpace)
                .toggleStyle(.button)
                .padding(.top, 50)
        }
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error:
                        fallthrough
                    case .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
            
        
/*
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            Text("Hello, world!")

            Toggle("Show Immersive Space", isOn: $showImmersiveSpace)
                .toggleStyle(.button)
                .padding(.top, 50)
        }
        .padding()
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
          
        }
*/
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

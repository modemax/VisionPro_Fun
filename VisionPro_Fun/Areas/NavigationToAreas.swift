//
//  NavigationToAreas.swift
//  VisionPro_Fun
//
//  Created by Christopher Reese on 10/9/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct NavigationToAreas: View {
    var body: some View {
        VStack {
            Text("Vision Pro Experiences")
                .monospaced()
                .font(.system(size: 40, weight: .bold))
            
            HStack(spacing: 50) {
                ForEach(Area.allCases) { area in
                    NavigationLink {
                        //Text(area.title)
                        //    .monospaced()
                        //    .font(.system(size: 40, weight: .bold))
                        
                        if area == Area.EarthDisplay {
                            EarthArea()
                        }
                    } label: {
                        Label(area.name, systemImage: "chevron.right")
                            .monospaced()
                            .font(.title)
                    }
                    .controlSize(.extraLarge)
                }
            }
        }
        .background()
        {
            Image("VisionPro_BG2")
        }
    }
}

#Preview {
    NavigationToAreas()
}

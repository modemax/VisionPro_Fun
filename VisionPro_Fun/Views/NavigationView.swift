//
//  NavigationView.swift
//  VisionPro_Fun
//
//  Created by Christopher Reese on 10/9/23.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        ZStack {
            NavigationStack {
                NavigationToAreas()
            }
        }
    }
}

#Preview {
    NavigationView()
}

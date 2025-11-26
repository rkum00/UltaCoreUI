//
//  ContentView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 26/11/25.
//

import SwiftUI
import UltaCoreUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            SwiftUIView()
        }
    }
}

#Preview {
    ContentView()
}

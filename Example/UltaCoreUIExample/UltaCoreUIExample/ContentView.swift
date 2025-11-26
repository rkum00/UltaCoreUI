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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            SwiftUIView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

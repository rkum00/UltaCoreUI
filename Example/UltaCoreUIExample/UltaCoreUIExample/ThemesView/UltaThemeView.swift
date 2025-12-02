//
//  UltaThemeView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 02/12/25.
//

import SwiftUI

struct UltaThemeView: View {
    let itemName: String
    var body: some View {
        List(themes, id: \.self) { item in
            NavigationLink(destination: DetailView(item: item)) {
                Text(item)
                    .padding(.vertical, 10)
            }
        }
        .navigationTitle("Color Options")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.plain)
    }
}

struct DetailView: View {
    let item: String
    
    var body: some View {
        Text("You selected \(item)")
            .font(.largeTitle)
            .padding()
            .navigationTitle(item)
    }
}

#Preview {
    UltaThemeView(itemName: "Theme View")
}

//
//  UltaThemeOptionsView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 02/12/25.
//

import SwiftUI

struct UltaOptionsThemeView: View {
    @StateObject var presenter: UltaThemeOptionsPresenter
    
    var body: some View {
        List(presenter.themes, id: \.self) { item in
            NavigationLink(
                destination: presenter.navigateToDetail(for: item)
            ) {
                Text(item)
                    .padding(.vertical, 10)
            }
        }
        .navigationTitle("Color Options")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.plain)
    }
}

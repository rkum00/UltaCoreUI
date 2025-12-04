//
//  UltaThemeOptionsView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 02/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaOptionsThemeView: View {
    @StateObject var presenter: UltaOptionsThemePresenter
    var selectedOption: OptionsPageType
    
    var body: some View {
        List(UBTheme.allCases, id: \.self) { theme in
            NavigationLink(
                destination: presenter.navigateToDetail(selectedPageOption: selectedOption, for: theme)
            ) {
                Text(theme.rawValue.capitalized)
                    .padding(.vertical, 10)
            }
        }
        .navigationTitle("Theme Options")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.plain)
    }
}

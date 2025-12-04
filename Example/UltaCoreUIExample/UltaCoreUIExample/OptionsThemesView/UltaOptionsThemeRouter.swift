//
//  UltaThemeOptionsRouter.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 03/12/25.
//

import SwiftUI
import UltaCoreUI

final class UltaOptionsThemeRouter {
    @ViewBuilder
    func makeDetailView(selectedPageOption: OptionsPageType, for theme: UBTheme) -> some View {
        switch selectedPageOption {
        case .ubText:
            UltaTextView(theme: theme, optionType: selectedPageOption)
        case .ubCardContainer:
            UltaCardContainerView(theme: theme, optionType: selectedPageOption)
        default:
            Text(theme.rawValue)
        }
    }
}


//
//  UltaThemeOptionsPresenter.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 03/12/25.
//

import SwiftUI
import UltaCoreUI

final class UltaOptionsThemePresenter: ObservableObject {
    private let router: UltaOptionsThemeRouter

    init(router: UltaOptionsThemeRouter) {
        self.router = router
    }
    func navigateToDetail(selectedPageOption: OptionsPageType, for theme: UBTheme) -> some View {
        router.makeDetailView(selectedPageOption: selectedPageOption, for: theme)
    }
}


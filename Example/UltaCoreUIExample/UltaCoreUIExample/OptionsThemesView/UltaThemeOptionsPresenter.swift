//
//  UltaThemeOptionsPresenter.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 03/12/25.
//

import SwiftUI

final class UltaThemeOptionsPresenter: ObservableObject {
    @Published var themes: [String] = []
    private let router: UltaOptionsThemeRouter

    init(router: UltaOptionsThemeRouter) {
        self.router = router
        loadThemes()
    }
    
    func loadThemes() {
        themes = ["Theme1", "Theme2", "Theme3"]
    }

    func navigateToDetail(for item: String) -> some View {
        router.makeDetailView(item: item)
    }
}


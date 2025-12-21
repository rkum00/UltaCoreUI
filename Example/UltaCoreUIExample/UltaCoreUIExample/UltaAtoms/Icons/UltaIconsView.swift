//
//  UltaIconsView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 20/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaIconsView: View {
    
    let presenter: UltaIconsPresenter
    let optionType: OptionsPageType
    let theme: UBTheme
    
    init(theme: UBTheme = UBTheme.current, optionType: OptionsPageType) {
        self.theme = theme
        self.presenter = UltaIconsPresenter(theme: theme)
        self.optionType = optionType
    }
    
    var body: some View {
        HStack {
            List {
                ForEach(0..<presenter.numberOfSections, id: \.self) { section in
                    Section(header: sectionHeader(section: section)) {
                        ForEach(0..<presenter.getRowsCount(for: section), id: \.self) { row in
                            UltaIconsRowView(iconName: presenter.getComponentName(row: row, section: section),
                                             icon: presenter.getIcon(row: row, section: section),
                                             tintColor: presenter.getTintColor(row: row, section: section),
                                             section: section,
                                             row: row)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
        }
        .navigationTitle("\(optionType.rawValue) Options")
    }
    
    private func sectionHeader(section: Int) -> some View {
        Text(presenter.getSectionTitle(section: section))
    }
}

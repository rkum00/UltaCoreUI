//
//  UltaColorsView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 18/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaColorsView: View {
    
    let presenter: UltaColorsPresenter
    let optionType: OptionsPageType
    let theme: UBTheme
    
    init(theme: UBTheme = UBTheme.current, optionType: OptionsPageType) {
        self.theme = theme
        self.presenter = UltaColorsPresenter(theme: theme)
        self.optionType = optionType
    }
    
    var body: some View {
        HStack {
            List {
                ForEach(0..<presenter.numberOfSections, id: \.self) { section in
                    Section(header: sectionHeader(section: section)) {
                        ForEach(0..<presenter.getRowsCount(for: section), id: \.self) { row in
                            UltaColorsRowView(name: presenter.getComponentName(row: row, section: section),
                                              section: section,
                                              row: row)
                            .listRowBackground(presenter.getComponentBackgroundColor(row: row, section: section))
                        }
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(GroupedListStyle())
        }
        .navigationTitle("\(optionType.rawValue) \(theme.rawValue.capitalized) Options")
    }
    
    private func sectionHeader(section: Int) -> some View {
        Text(presenter.getSectionTitle(section: section))
    }
}

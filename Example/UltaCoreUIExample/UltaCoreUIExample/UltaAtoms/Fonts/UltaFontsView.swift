//
//  UltaFontsView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 19/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaFontsView: View {
    
    let presenter: UltaFontsPresenter
    let optionType: OptionsPageType
    
    init(theme: UBTheme = UBTheme.current, optionType: OptionsPageType) {
        self.presenter = UltaFontsPresenter(theme: theme)
        self.optionType = optionType
    }
    
    var body: some View {
        HStack {
            List {
                ForEach(0..<presenter.numberOfSections, id: \.self) { section in
                    Section(header: sectionHeader(section: section)) {
                        ForEach(0..<presenter.getRowsCount(for: section), id: \.self) { row in
                            UltaFontsRowView(title: presenter.getComponentName(row: row, section: section),
                                             familyName: presenter.getComponentFamilyName(row: row, section: section),
                                             fontSize: presenter.getComponentFontSize(row: row, section: section), textColor: presenter.getComponentTextColor(row: row, section: section),
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

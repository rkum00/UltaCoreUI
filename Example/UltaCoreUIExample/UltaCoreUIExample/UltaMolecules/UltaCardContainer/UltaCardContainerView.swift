//
//  UltaCardContainerView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 04/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaCardContainerView: View {
    var presenter: UltaCardContainerViewPresenter
    var optionType: OptionsPageType
    
    init(theme: UBTheme = UBTheme.current, optionType: OptionsPageType) {
        self.presenter = UltaCardContainerViewPresenter(theme: theme)
        self.optionType = optionType
    }
    
    var body: some View {
        HStack {
            List {
                ForEach(0..<presenter.numberOfSections, id: \.self) { section in
                    Section(header: sectionHeader(section: section)) {
                        ForEach(0..<presenter.getRowsCount(for: section), id: \.self) { row in
                            UltaCardContainerRowView(ubCardContainer: presenter.getComponent(row: row, section: section), section: section, row: row)
                                .padding()
                        }
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .environment(\.defaultMinListRowHeight, 8)
            .listStyle(GroupedListStyle())
        }
        .navigationTitle("\(optionType.rawValue) Options")
    }
    
    private func sectionHeader(section: Int) -> some View {
        if UltaTextViewOptions.allCases[section] == .topDescription {
            Text(presenter.getSectionTitle(section: section))
        } else {
            Text(presenter.getSectionTitle(section: section))
        }
    }
    
}

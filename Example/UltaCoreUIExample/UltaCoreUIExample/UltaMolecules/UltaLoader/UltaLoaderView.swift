//
//  UltaLoaderView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 17/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaLoaderView: View {
    
    let presenter: UltaLoaderPresenter
    let optionType: OptionsPageType
    
    /// The initializer for the UltaLoaderView.
    /// - Parameter theme: The theme to be used for the spinner. Defaults to the current theme.
    init(theme: UBTheme = UBTheme.current, optionType: OptionsPageType) {
        self.presenter = UltaLoaderPresenter(theme: theme)
        self.optionType = optionType
    }
    
    var body: some View {
        HStack {
            List {
                ForEach(0..<presenter.numberOfSections, id: \.self) { section in
                    Section(header: sectionHeader(section: section)) {
                        ForEach(0..<presenter.getRowsCount(for: section), id: \.self) { row in
                            UltaLoaderRowView(
                                ubLoader: presenter.getComponent(row: row, section: section),
                                section: section,
                                row: row
                            )
                            .background((section == 1 && row == 1) ? Color.gray : Color.clear)
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
    
    ///  Returns the section header view for the given section index.
    /// - Parameter section: The section index for which the header is to be returned.
    /// - Returns: A view representing the section header.
    private func sectionHeader(section: Int) -> some View {
        Text(presenter.getSectionTitle(section: section))
    }
}

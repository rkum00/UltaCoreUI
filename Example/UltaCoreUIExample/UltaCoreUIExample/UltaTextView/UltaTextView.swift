//
//  UltaTextView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 03/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaTextView: View {
        
    public init(theme: UBTheme = UBTheme.current) {
        self.presenter = UltaTextViewPresenter(theme: theme)
    }
    
    var presenter: UltaTextViewPresenter

    @State private var isCellTapped: Bool = false
    
    var body: some View {
        HStack {
            List {
                ForEach(0..<presenter.numberOfSections, id: \.self) { section in
                    Section(header: sectionHeader(section: section)) {
                        ForEach(0..<presenter.getRowsCount(for: section), id: \.self) { row in
                            UltaTextRowView(ubText: presenter.getComponent(row: row, section: section, isTapped: false),
                                                    section: section,
                                                    row: row
                            )
                        }
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .environment(\.defaultMinListRowHeight, 8)
            .listStyle(GroupedListStyle())
        }
        .navigationTitle("Text")
    }

    private func sectionHeader(section: Int) -> some View {
        if UltaTextViewOptions.allCases[section] == .topDescription {
            Text(presenter.getSectionTitle(section: section))
        } else {
            Text(presenter.getSectionTitle(section: section))
        }
    }

}

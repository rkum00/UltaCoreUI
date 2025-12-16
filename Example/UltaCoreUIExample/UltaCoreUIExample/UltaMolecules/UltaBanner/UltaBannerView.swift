//
//  UltaBannerView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 15/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaBannerView: View {
    let presenter: UltaBannerViewPresenter
    let optionType: OptionsPageType
    
    @State private var dismissedBanners: Set<String> = []
    
    init(theme: UBTheme = .current, optionType: OptionsPageType) {
        self.presenter = UltaBannerViewPresenter(theme: theme)
        self.optionType = optionType
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: UBGlobal.space600) {
                ForEach(0..<presenter.numberOfSections, id: \.self) { section in
                    groupedSection(section: section)
                }
            }
            .padding(.vertical, UBGlobal.space400)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("\(optionType.rawValue) Options")
    }
    
    // MARK: - Grouped Section
    private func groupedSection(section: Int) -> some View {
        VStack(alignment: .leading, spacing: UBGlobal.space200) {
            sectionHeader(section: section)
            VStack(spacing: UBGlobal.space0) {
                ForEach(0..<presenter.getRowsCount(for: section), id: \.self) { row in
                    bannerRow(section: section, row: row)
                }
            }
            .background(.white)
            .padding(.horizontal)
        }
    }
    
    // MARK: - Row
    @ViewBuilder
    private func bannerRow(section: Int, row: Int) -> some View {
        let id = "\(section)-\(row)"
        
        if !dismissedBanners.contains(id) {
            UltaBannerRowView(
                ubBanner: presenter.getComponent(
                    row: row,
                    section: section,
                    onClose: { _ in
                        dismissedBanners.insert(id)
                    }
                ),
                section: section,
                row: row
            )
            .padding(.vertical, UBGlobal.space300)
        }
    }
    
    private func sectionHeader(section: Int) -> some View {
        UBText(textAttribute: TextAttributes(text: presenter.getSectionTitle(section: section),
                                             color: .neutralLow,
                                             fontSize: .large,
                                             fontWeight: .bold))
        .padding(.horizontal, UBGlobal.space400)
    }
}

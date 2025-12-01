//
//  ContentView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 26/11/25.
//

import SwiftUI
import UltaCoreUI

struct ContentView: View {
    @State private var expandedSections: Set<String> = []
    
    var body: some View {
        NavigationView {
            List {
                SectionView(
                    title: "Atoms",
                    items: ["Colors", "Fonts", "Icons"],
                    isExpanded: expandedSections.contains("Atoms"),
                    toggleExpand: { toggleSection("Atoms") }
                )
                .listRowSeparator(.hidden)
                
                SectionView(
                    title: "Molecules",
                    items: ["UBText", "UBButton", "UBCardContainer"],
                    isExpanded: expandedSections.contains("Molecules"),
                    toggleExpand: { toggleSection("Molecules") }
                )
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Home Page")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func toggleSection(_ section: String) {
        if expandedSections.contains(section) {
            expandedSections.remove(section)
        } else {
            expandedSections.insert(section)
        }
    }
}

struct SectionView: View {
    let title: String
    let items: [String]
    let isExpanded: Bool
    let toggleExpand: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
            }
            .padding(.vertical, 5)
            .frame(height: 50)
            .contentShape(Rectangle())
            .onTapGesture {
                toggleExpand()
            }
            
            if isExpanded {
                Divider()
                ForEach(items.indices, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Text(items[index])
                            .padding(.leading, 20)
                            .frame(height: 40)
                        Divider()
                    }
                }
            }
        }
    }
}

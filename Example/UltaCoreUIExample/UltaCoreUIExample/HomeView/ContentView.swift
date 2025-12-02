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
                ForEach(sections) { section in
                    Section(header: SectionHeader(
                        title: section.title,
                        isExpanded: expandedSections.contains(section.title),
                        onTap: { toggle(section.title) }
                    )) {
                        
                        if expandedSections.contains(section.title) {
                            ForEach(section.items, id: \.self) { item in
                                NavigationLink(destination: UltaThemeView(itemName: item)) {
                                    Text(item)
                                        .padding(.vertical, 10)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Home Page")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
        }
    }
    
    private func toggle(_ section: String) {
        if expandedSections.contains(section) {
            expandedSections.remove(section)
        } else {
            expandedSections.insert(section)
        }
    }
}

struct SectionHeader: View {
    let title: String
    let isExpanded: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            ZStack {
                Text(title)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                
                HStack {
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.black)
                        .font(.title3)
                        .padding(.trailing, 20)
                }
            }
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
    }
}

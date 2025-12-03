//
//  UBConstants.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 02/12/25.
//

import Foundation

struct SectionData: Identifiable {
    let id = UUID()
    let title: String
    let items: [String]
}

let sections: [SectionData] = [
    SectionData(title: "Atoms", items: ["Colors", "Fonts", "Icons"]),
    SectionData(title: "Molecules", items: ["UBText", "UBButton", "UBCardContainer"])
]

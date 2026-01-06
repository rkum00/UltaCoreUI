//
//  UltaPickupRowView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 05/01/26.
//

import SwiftUI


struct UltaPickupRowView<Content: View>: View {
    
    var ubCardContainer: Content
    var section: Int
    var row: Int
    
    init(ubCardContainer: Content,
         section: Int,
         row: Int) {
        self.ubCardContainer = ubCardContainer
        self.section = section
        self.row = row
    }
    
    var body: some View {
        ubCardContainer
            .padding()
    }
}

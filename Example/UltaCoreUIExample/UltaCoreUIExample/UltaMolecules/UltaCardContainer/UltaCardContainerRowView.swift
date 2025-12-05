//
//  UltaCardContainerRowView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 04/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaCardContainerRowView<Content: View>: View {
    
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

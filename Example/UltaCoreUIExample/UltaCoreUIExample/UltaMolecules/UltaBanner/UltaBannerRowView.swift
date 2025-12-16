//
//  UltaBannerRowView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 15/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaBannerRowView: View {
    
    var ubBanner: UBBannerView
    var section: Int
    var row: Int
    
    init(ubBanner: UBBannerView,
         section: Int,
         row: Int) {
        self.ubBanner = ubBanner
        self.section = section
        self.row = row
    }
    
    var body: some View {
        ubBanner
            .padding()
    }
}

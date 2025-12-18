//
//  UltaLoaderRowView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 17/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaLoaderRowView: View {
    var ubLoader: UBLoaderView
    
    var section: Int
    var row: Int
    
    ///  Initializes a new instance of `UltaLoaderRowView`.
    /// - Parameters:
    ///   - ubLoader: The `UBLoaderView` instance to be displayed in the cell.
    ///   - section: The section index of the cell, useful for identifying the cell in a list or grid.
    ///   - row:  The section and row indices for the cell, useful for identifying the cell in a list or grid.
    public init(ubLoader: UBLoaderView,
                section: Int,
                row: Int
    ) {
        self.ubLoader = ubLoader
        self.section = section
        self.row = row
    }
    
    var body: some View {
        ubLoader
        .frame(maxWidth: .infinity)
    }
}

//
//  UltaLoaderOptions.swift
//  UltaCoreUIExample
//
//  Created by Rakesh KUBr on 17/12/25.
//

import Foundation
import UltaCoreUI

/// This enum defines the options available for the UBLoader component.
public enum UltaLoaderOptions: String, CaseIterable {
    case topDescription = "Loaders indicate that a part of the product is currently loading or processing a task when the duration is unknown."
    case color = "Color Options"
    case size = "Size Options"
    case label = "Label Options"
    
    /// Returns the number of rows for each option.
    /// - Returns: The number of rows for the current option.
    func numberOfRows() -> Int {
        switch self {
        case .topDescription:
            return 0
        case .color:
            return UBLoaderColor.allCases.count
        case .size, .label:
            return UBLoaderSize.allCases.count
        }
    }
    
    /// - Parameters:
    ///   - row: the row index for which the component is required.
    ///   - theme: it is used for selecting the color based on the theme selected from UBTheme options
    /// - Returns: Returns the UBLoaderView component based on the row selected.
    func getColorOptions(row: Int, theme: UBTheme) -> UBLoaderView {
        switch UBLoaderColor.allCases[row] {
        case .primary:
            return UBLoaderView(theme: theme, color: .primary, size: .large, labelText: "Primary Color")
        case .inverse:
            return UBLoaderView(theme: theme, color: .inverse, size: .large, labelText: "Inverse Color")
        }
    }
    
    /// - Parameters:
    ///   - row: the row index for which the component is required.
    ///   - theme: it is used for selecting the color based on the theme selected from UBTheme options
    /// - Returns: Returns the UBLoaderView component based on the row selected.
    func getSizeOptions(row: Int, theme: UBTheme) -> UBLoaderView {
        switch UBLoaderSize.allCases[row] {
        case .xSmall:
            return UBLoaderView(theme: theme, color: .primary, size: .xSmall)
        case .small:
            return UBLoaderView(theme: theme, color: .primary, size: .small)
        case .medium:
            return UBLoaderView(theme: theme, color: .primary, size: .medium)
        case .large:
            return UBLoaderView(theme: theme, color: .primary, size: .large)
        case .xLarge:
            return UBLoaderView(theme: theme, color: .primary, size: .xLarge)
        }
    }
    
    /// - Parameters:
    ///   - row: the row index for which the component is required.
    ///   - theme: it is used for selecting the color based on the theme selected from UBTheme options
    /// - Returns: Returns the UBLoaderView component based on the row selected.
    func getLabelOptions(row: Int, theme: UBTheme) -> UBLoaderView {
        switch UBLoaderSize.allCases[row] {
        case .xSmall:
            return UBLoaderView(theme: theme, color: .primary, size: .xSmall, labelText: "Loading...")
        case .small:
            return UBLoaderView(theme: theme, color: .primary, size: .small, labelText: "Loading...")
        case .medium:
            return UBLoaderView(theme: theme, color: .primary, size: .medium, labelText: "Loading...")
        case .large:
            return UBLoaderView(theme: theme, color: .primary, size: .large, labelText: "Loading...")
        case .xLarge:
            return UBLoaderView(theme: theme, color: .primary, size: .xLarge, labelText: "Loading...")
        }
    }
}

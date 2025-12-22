//
//  UltaButtonViewOptions.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 22/12/25.
//

import Foundation
import UltaCoreUI

enum ButtonColorOptions: String, CaseIterable {
    case primaryFilled = "Filled, Primary"
    case primaryOutlined = "Outlined, Primary"
    case subtlePrimary = "Subtle, Primary"
    case primaryTransparent = "Transparent, Primary"
    
    case neutralFilled = "Filled, Neutral"
    case neutralOutlined = "Outlined, Neutral"
    case neutralTransparent = "Transparent, Neutral"
    case neutralOutlinedInverse = "Outlined Inverse, Inverse"
}

public enum UltaButtonViewOptions: String, CaseIterable {
    case topDescription = "A button is an interactive UI control that responds to user input by executing an action."
    case color = "Variants"
    case disabled = "Disabled"
    case size = "All size options"
    case buttonWithIcons = "Button With Icons"
    case width = "All width options"
    case ada = "All ada options"
    
    func numberOfRows() -> Int {
        switch self {
        case .topDescription:
            return 0
        case .color, .disabled:
            return ButtonColorOptions.allCases.count
        case .size:
            return ButtonSize.allCases.count
        case .buttonWithIcons:
            return 2
        case .width:
            return 3
        case .ada:
            return AdaType.allCases.count
        }
    }
    
    func getColorComponent(row: Int, theme: UBTheme, text: String, image: String?, action: @escaping () -> Void) -> UBButton {
        switch ButtonColorOptions.allCases[row] {
        case .primaryFilled:
            let button = UBButton(label: text, variant: .filledPrimary, theme: theme, action: action)
            return button
        case .neutralFilled:
            let button = UBButton(label: text, variant: .filledNeutral, theme: theme, action: action)
            return button
        case .primaryOutlined:
            let button = UBButton(label: text, variant: .outlinedPrimary, theme: theme, action: action)
            return button
        case .neutralOutlined:
            let button = UBButton(label: text, variant: .outlinedNeutral, theme: theme, action: action)
            return button
        case .neutralOutlinedInverse:
            let button = UBButton(label: text, variant: .outlinedInverseNeutral, theme: theme, action: action)
            return button
        case .subtlePrimary:
            let button = UBButton(label: text, variant: .subtlePrimary, theme: theme, action: action)
            return button
        case .primaryTransparent:
            let button = UBButton(label: text, variant: .transparentPrimary, theme: theme, action: action)
            return button
        case .neutralTransparent:
            let button = UBButton(label: text, variant: .transparentNeutral, theme: theme, action: action)
            return button
        }
    }
    
    func getDisabledComponent(row: Int, theme: UBTheme, text: String, image: String?, action: @escaping () -> Void) -> UBButton {
        switch ButtonColorOptions.allCases[row] {
        case .primaryFilled:
            let button = UBButton(label: text, disabled: true, variant: .filledPrimary, theme: theme, action: action)
            return button
        case .neutralFilled:
            let button = UBButton(label: text, disabled: true, variant: .filledNeutral, theme: theme, action: action)
            return button
        case .primaryOutlined:
            let button = UBButton(label: text, disabled: true, variant: .outlinedPrimary, theme: theme, action: action)
            return button
        case .neutralOutlined:
            let button = UBButton(label: text, disabled: true, variant: .outlinedNeutral, theme: theme, action: action)
            return button
        case .neutralOutlinedInverse:
            let button = UBButton(label: text, disabled: true, variant: .outlinedInverseNeutral, theme: theme, action: action)
            return button
        case .subtlePrimary:
            let button = UBButton(label: text, disabled: true, variant: .subtlePrimary, theme: theme, action: action)
            return button
        case .primaryTransparent:
            let button = UBButton(label: text, disabled: true, variant: .transparentPrimary, theme: theme, action: action)
            return button
        case .neutralTransparent:
            let button = UBButton(label: text, disabled: true, variant: .transparentNeutral, theme: theme, action: action)
            return button
        }
    }
    
    func getSizeComponent(row: Int, theme: UBTheme, text: String, image: String?, action: @escaping () -> Void) -> UBButton {
        switch ButtonSize.allCases[row] {
        case .small:
            return UBButton(label: text, variant: .filledPrimary, size: .small, theme: theme, action: action)
        case .medium:
            return UBButton(label: text, variant: .filledPrimary, size: .medium, theme: theme, action: action)
        case .large:
            return UBButton(label: text, variant: .filledPrimary, size: .large, theme: theme, action: action)
        }
    }
    
    func getButtonWithIcons(row: Int, theme: UBTheme, action: @escaping () -> Void) -> UBButton {
        switch row {
        case 0:
            return UBButton(label: "Leading", variant: .filledPrimary, leading: Slot(imageName: StyleDictionaryGlobalEnumIcons.wifiOutline24.rawValue), theme: theme, action: action)
        default:
            return UBButton(label: "Trailing", variant: .filledPrimary, trailing: Slot(imageName: StyleDictionaryGlobalEnumIcons.wifiOutline24.rawValue), theme: theme, action: action)
        }
    }
    
    func getWidthOptions(row: Int, theme: UBTheme, action: @escaping () -> Void) -> UBButton {
        switch row {
        case 0:
            return UBButton(label: "Default width", variant: .filledPrimary, leading: Slot(imageName: StyleDictionaryGlobalEnumIcons.wifiOutline24.rawValue), theme: theme, action: action)
        case 1:
            return UBButton(label: "Full width", variant: .filledPrimary, fullWidth: true, theme: theme, action: action)
        default:
            return UBButton(label: "Full width with Image", variant: .filledPrimary, fullWidth: true, leading: Slot(imageName: StyleDictionaryGlobalEnumIcons.wifiOutline24.rawValue), theme: theme, action: action)
        }
    }
    
    func getOverflowOptions(row: Int, theme: UBTheme, action: @escaping () -> Void) -> UBButton {
        return UBButton(label: "When limited space, the content can wrap to the next line", variant: .filledPrimary, fullWidth: true, leading: Slot(imageName: StyleDictionaryGlobalEnumIcons.editOutline24.rawValue), theme: theme, action: action)
    }
    
    func getAdaOptions(row: Int, theme: UBTheme, action: @escaping () -> Void) -> UBButton {
        switch AdaType.allCases[row] {
        case .button:
            let button = UBButton(label: "A text button to be announced as a button", variant: .filledPrimary, fullWidth: true, theme: theme, accessibilityInfo: UBButtonAccessibilityInfo(ubButtonAccessibilityHint: "Accessibility Hint", ubButtonAccessibilityLabel: "Accessibility Label"), accessibilityTraits: .isButton, action: action)
            return button
        case .link:
            let button = UBButton(label: "A text button to be announced as a link", variant: .filledPrimary, fullWidth: true, theme: theme, accessibilityInfo: UBButtonAccessibilityInfo(ubButtonAccessibilityHint: "Accessibility Hint", ubButtonAccessibilityLabel: "Accessibility Label"), accessibilityTraits: .isLink, action: action)
            return button
        }
    }
    
    func isFullWidth(row: Int) -> Bool {
        switch row {
        case 0:
            return false
        default:
            return true
        }
    }
}

/// These all the ada options are supported by Link component
public enum AdaType: CaseIterable {
    case button
    case link
}

/// Accessibility roles for the Button and Link component
public enum AccessibilityRole: CaseIterable {
    case button
    case link
}

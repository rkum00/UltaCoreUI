//
//  UltaBannerViewOptions.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 15/12/25.
//

import SwiftUI
import UltaCoreUI

public enum UltaBannerViewOptions: String, CaseIterable {
    case topDescription = "Description for Banner."
    case autoDismiss = "Auto Dismissal"
    case background = "Background"
    
    func numberOfRows() -> Int {
        switch self {
        case .topDescription:
            return 0
        case .autoDismiss, .background:
            return UBBannerType.allCases.count
        }
    }
    
    func getAutoDismissalComponent(section: Int, row: Int, theme: UBTheme = .current, onClose: ((UBBannerType)->Void)? = nil) -> UBBannerView {
        
        switch UBBannerType.allCases[row] {
        case .success:
            UBBannerView(title: "Success", message: "Operation completed.", type: .success, textColor: .neutralHighInverse, leading: Slot(imageName: StyleDictionaryGlobalEnumIcons.checkmarkCircleOutline24.rawValue), trailing: Slot(imageName: StyleDictionaryGlobalEnumIcons.closeOutline16.rawValue), duration: 2, theme: theme, onClose: onClose)
        case .error:
            UBBannerView(title: "Error", message: "Operation failed.", type: .error, textColor: .neutralHighInverse, leading: Slot(imageName: StyleDictionaryGlobalEnumIcons.errorFilled24.rawValue), trailing: Slot(imageName: StyleDictionaryGlobalEnumIcons.closeOutline16.rawValue), duration: 3, theme: theme, onClose: onClose)
        case .warning:
            UBBannerView(title: "Waring", message: "Operation throwing warning.", type: .warning, textColor: .neutralHighInverse, leading: Slot(imageName: StyleDictionaryGlobalEnumIcons.warningFilled24.rawValue), trailing: Slot(imageName: StyleDictionaryGlobalEnumIcons.closeOutline16.rawValue), duration: 4, theme: theme, onClose: onClose)
        case .info:
            UBBannerView(title: "Info", message: "Operation information.", type: .info, textColor: .neutralHighInverse, leading: Slot(imageName: StyleDictionaryGlobalEnumIcons.infoFilled24.rawValue), trailing: Slot(imageName: StyleDictionaryGlobalEnumIcons.closeOutline16.rawValue), duration: 5, theme: theme, onClose: onClose)
        }
    }
    
    func getBackgroundColorComponent(section: Int, row: Int, theme: UBTheme = .current, onClose: ((UBBannerType)->Void)? = nil) -> UBBannerView {
        
        switch UBBannerType.allCases[row] {
        case .success:
            UBBannerView(title: "Success", message: "Operation completed.", type: .success, textColor: .neutralHighInverse, leading: Slot(imageName: StyleDictionaryGlobalEnumIcons.checkmarkCircleOutline24.rawValue), trailing: Slot(imageName: StyleDictionaryGlobalEnumIcons.closeOutline16.rawValue), theme: theme, onClose: onClose)
        case .error:
            UBBannerView(title: "Error", message: "Operation failed.", type: .error, textColor: .neutralHighInverse, leading: Slot(imageName: StyleDictionaryGlobalEnumIcons.errorFilled24.rawValue), trailing: Slot(imageName: StyleDictionaryGlobalEnumIcons.closeOutline16.rawValue), theme: theme, onClose: onClose)
        case .warning:
            UBBannerView(title: "Waring", message: "Operation throwing warning.", type: .warning, textColor: .neutralHighInverse, leading: Slot(imageName: StyleDictionaryGlobalEnumIcons.warningFilled24.rawValue), trailing: Slot(imageName: StyleDictionaryGlobalEnumIcons.closeOutline16.rawValue), theme: theme, onClose: onClose)
        case .info:
            UBBannerView(title: "Info", message: "Operation information.", type: .info, textColor: .neutralHighInverse, leading: Slot(imageName: StyleDictionaryGlobalEnumIcons.infoFilled24.rawValue), trailing: Slot(imageName: StyleDictionaryGlobalEnumIcons.closeOutline16.rawValue), theme: theme, onClose: onClose)
        }
    }
}

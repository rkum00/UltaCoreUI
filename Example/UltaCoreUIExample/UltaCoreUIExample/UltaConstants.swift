//
//  UBConstants.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 02/12/25.
//

import UIKit
import UltaCoreUI

public enum GlobalTheme1ColorEnum: String, CaseIterable {
    case ubThemeColorBackgroundBaseline
    case ubThemeColorBackgroundBaselineInverse
    case ubThemeColorBackgroundDisabled
    case ubThemeColorBackgroundError
    case ubThemeColorBackgroundErrorInverse
    case ubThemeColorBackgroundInfo
    case ubThemeColorBackgroundInfoInverse
    case ubThemeColorBackgroundOverlay
    case ubThemeColorBackgroundPositive
    case ubThemeColorBackgroundPositiveInverse
    case ubThemeColorBackgroundPrimary
    case ubThemeColorBackgroundRaised
    case ubThemeColorBackgroundRaisedInverse
    case ubThemeColorBackgroundSunken
    case ubThemeColorBackgroundWarning
    case ubThemeColorBackgroundWarningInverse
    case ubThemeColorForegroundDisabled
    case ubThemeColorForegroundError
    case ubThemeColorForegroundErrorInverse
    case ubThemeColorForegroundInfo
    case ubThemeColorForegroundInfoInverse
    case ubThemeColorForegroundNeutralHigh
    case ubThemeColorForegroundNeutralHighInverse
    case ubThemeColorForegroundNeutralLow
    case ubThemeColorForegroundNeutralMedium
    case ubThemeColorForegroundOnPrimary
    case ubThemeColorForegroundPositive
    case ubThemeColorForegroundPositiveInverse
    case ubThemeColorForegroundPrimary
    case ubThemeColorForegroundWarning
    case ubThemeColorForegroundWarningInverse
    case ubThemeColorOutlineDisabled
    case ubThemeColorOutlineError
    case ubThemeColorOutlineInfo
    case ubThemeColorOutlineNeutralHigh
    case ubThemeColorOutlineNeutralHighInverse
    case ubThemeColorOutlineNeutralLow
    case ubThemeColorOutlineNeutralMedium
    case ubThemeColorOutlinePositive
    case ubThemeColorOutlinePrimary
    case ubThemeColorOutlineWarning
    
    public var associatedColor: UIColor {
        switch self {
        case .ubThemeColorBackgroundBaseline: return Theme1.ubThemeColorBackgroundBaseline
        case .ubThemeColorBackgroundBaselineInverse: return Theme1.ubThemeColorBackgroundBaselineInverse
        case .ubThemeColorBackgroundDisabled: return Theme1.ubThemeColorBackgroundDisabled
        case .ubThemeColorBackgroundError: return Theme1.ubThemeColorBackgroundError
        case .ubThemeColorBackgroundErrorInverse: return Theme1.ubThemeColorBackgroundErrorInverse
        case .ubThemeColorBackgroundInfo: return Theme1.ubThemeColorBackgroundInfo
        case .ubThemeColorBackgroundInfoInverse: return Theme1.ubThemeColorBackgroundInfoInverse
        case .ubThemeColorBackgroundOverlay: return Theme1.ubThemeColorBackgroundOverlay
        case .ubThemeColorBackgroundPositive: return Theme1.ubThemeColorBackgroundPositive
        case .ubThemeColorBackgroundPositiveInverse: return Theme1.ubThemeColorBackgroundPositiveInverse
        case .ubThemeColorBackgroundPrimary: return Theme1.ubThemeColorBackgroundPrimary
        case .ubThemeColorBackgroundRaised: return Theme1.ubThemeColorBackgroundRaised
        case .ubThemeColorBackgroundRaisedInverse: return Theme1.ubThemeColorBackgroundRaisedInverse
        case .ubThemeColorBackgroundSunken: return Theme1.ubThemeColorBackgroundSunken
        case .ubThemeColorBackgroundWarning: return Theme1.ubThemeColorBackgroundWarning
        case .ubThemeColorBackgroundWarningInverse: return Theme1.ubThemeColorBackgroundWarningInverse
        case .ubThemeColorForegroundDisabled: return Theme1.ubThemeColorForegroundDisabled
        case .ubThemeColorForegroundError: return Theme1.ubThemeColorForegroundError
        case .ubThemeColorForegroundErrorInverse: return Theme1.ubThemeColorForegroundErrorInverse
        case .ubThemeColorForegroundInfo: return Theme1.ubThemeColorForegroundInfo
        case .ubThemeColorForegroundInfoInverse: return Theme1.ubThemeColorForegroundInfoInverse
        case .ubThemeColorForegroundNeutralHigh: return Theme1.ubThemeColorForegroundNeutralHigh
        case .ubThemeColorForegroundNeutralHighInverse: return Theme1.ubThemeColorForegroundNeutralHighInverse
        case .ubThemeColorForegroundNeutralLow: return Theme1.ubThemeColorForegroundNeutralLow
        case .ubThemeColorForegroundNeutralMedium: return Theme1.ubThemeColorForegroundNeutralMedium
        case .ubThemeColorForegroundOnPrimary: return Theme1.ubThemeColorForegroundOnPrimary
        case .ubThemeColorForegroundPositive: return Theme1.ubThemeColorForegroundPositive
        case .ubThemeColorForegroundPositiveInverse: return Theme1.ubThemeColorForegroundPositiveInverse
        case .ubThemeColorForegroundPrimary: return Theme1.ubThemeColorForegroundPrimary
        case .ubThemeColorForegroundWarning: return Theme1.ubThemeColorForegroundWarning
        case .ubThemeColorForegroundWarningInverse: return Theme1.ubThemeColorForegroundWarningInverse
        case .ubThemeColorOutlineDisabled: return Theme1.ubThemeColorOutlineDisabled
        case .ubThemeColorOutlineError: return Theme1.ubThemeColorOutlineError
        case .ubThemeColorOutlineInfo: return Theme1.ubThemeColorOutlineInfo
        case .ubThemeColorOutlineNeutralHigh: return Theme1.ubThemeColorOutlineNeutralHigh
        case .ubThemeColorOutlineNeutralHighInverse: return Theme1.ubThemeColorOutlineNeutralHighInverse
        case .ubThemeColorOutlineNeutralLow: return Theme1.ubThemeColorOutlineNeutralLow
        case .ubThemeColorOutlineNeutralMedium: return Theme1.ubThemeColorOutlineNeutralMedium
        case .ubThemeColorOutlinePositive: return Theme1.ubThemeColorOutlinePositive
        case .ubThemeColorOutlinePrimary: return Theme1.ubThemeColorOutlinePrimary
        case .ubThemeColorOutlineWarning: return Theme1.ubThemeColorOutlineWarning
        }
    }
}

public enum GlobalTheme2ColorEnum: String, CaseIterable {
    case ubThemeColorBackgroundBaseline
    case ubThemeColorBackgroundBaselineInverse
    case ubThemeColorBackgroundDisabled
    case ubThemeColorBackgroundError
    case ubThemeColorBackgroundErrorInverse
    case ubThemeColorBackgroundInfo
    case ubThemeColorBackgroundInfoInverse
    case ubThemeColorBackgroundOverlay
    case ubThemeColorBackgroundPositive
    case ubThemeColorBackgroundPositiveInverse
    case ubThemeColorBackgroundPrimary
    case ubThemeColorBackgroundRaised
    case ubThemeColorBackgroundRaisedInverse
    case ubThemeColorBackgroundSunken
    case ubThemeColorBackgroundWarning
    case ubThemeColorBackgroundWarningInverse
    case ubThemeColorForegroundDisabled
    case ubThemeColorForegroundError
    case ubThemeColorForegroundErrorInverse
    case ubThemeColorForegroundInfo
    case ubThemeColorForegroundInfoInverse
    case ubThemeColorForegroundNeutralHigh
    case ubThemeColorForegroundNeutralHighInverse
    case ubThemeColorForegroundNeutralLow
    case ubThemeColorForegroundNeutralMedium
    case ubThemeColorForegroundOnPrimary
    case ubThemeColorForegroundPositive
    case ubThemeColorForegroundPositiveInverse
    case ubThemeColorForegroundPrimary
    case ubThemeColorForegroundWarning
    case ubThemeColorForegroundWarningInverse
    case ubThemeColorOutlineDisabled
    case ubThemeColorOutlineError
    case ubThemeColorOutlineInfo
    case ubThemeColorOutlineNeutralHigh
    case ubThemeColorOutlineNeutralHighInverse
    case ubThemeColorOutlineNeutralLow
    case ubThemeColorOutlineNeutralMedium
    case ubThemeColorOutlinePositive
    case ubThemeColorOutlinePrimary
    case ubThemeColorOutlineWarning
    
    public var associatedColor: UIColor {
        switch self {
        case .ubThemeColorBackgroundBaseline: return Theme2.ubThemeColorBackgroundBaseline
        case .ubThemeColorBackgroundBaselineInverse: return Theme2.ubThemeColorBackgroundBaselineInverse
        case .ubThemeColorBackgroundDisabled: return Theme2.ubThemeColorBackgroundDisabled
        case .ubThemeColorBackgroundError: return Theme2.ubThemeColorBackgroundError
        case .ubThemeColorBackgroundErrorInverse: return Theme2.ubThemeColorBackgroundErrorInverse
        case .ubThemeColorBackgroundInfo: return Theme2.ubThemeColorBackgroundInfo
        case .ubThemeColorBackgroundInfoInverse: return Theme2.ubThemeColorBackgroundInfoInverse
        case .ubThemeColorBackgroundOverlay: return Theme2.ubThemeColorBackgroundOverlay
        case .ubThemeColorBackgroundPositive: return Theme2.ubThemeColorBackgroundPositive
        case .ubThemeColorBackgroundPositiveInverse: return Theme2.ubThemeColorBackgroundPositiveInverse
        case .ubThemeColorBackgroundPrimary: return Theme2.ubThemeColorBackgroundPrimary
        case .ubThemeColorBackgroundRaised: return Theme2.ubThemeColorBackgroundRaised
        case .ubThemeColorBackgroundRaisedInverse: return Theme2.ubThemeColorBackgroundRaisedInverse
        case .ubThemeColorBackgroundSunken: return Theme2.ubThemeColorBackgroundSunken
        case .ubThemeColorBackgroundWarning: return Theme2.ubThemeColorBackgroundWarning
        case .ubThemeColorBackgroundWarningInverse: return Theme2.ubThemeColorBackgroundWarningInverse
        case .ubThemeColorForegroundDisabled: return Theme2.ubThemeColorForegroundDisabled
        case .ubThemeColorForegroundError: return Theme2.ubThemeColorForegroundError
        case .ubThemeColorForegroundErrorInverse: return Theme2.ubThemeColorForegroundErrorInverse
        case .ubThemeColorForegroundInfo: return Theme2.ubThemeColorForegroundInfo
        case .ubThemeColorForegroundInfoInverse: return Theme2.ubThemeColorForegroundInfoInverse
        case .ubThemeColorForegroundNeutralHigh: return Theme2.ubThemeColorForegroundNeutralHigh
        case .ubThemeColorForegroundNeutralHighInverse: return Theme2.ubThemeColorForegroundNeutralHighInverse
        case .ubThemeColorForegroundNeutralLow: return Theme2.ubThemeColorForegroundNeutralLow
        case .ubThemeColorForegroundNeutralMedium: return Theme2.ubThemeColorForegroundNeutralMedium
        case .ubThemeColorForegroundOnPrimary: return Theme2.ubThemeColorForegroundOnPrimary
        case .ubThemeColorForegroundPositive: return Theme2.ubThemeColorForegroundPositive
        case .ubThemeColorForegroundPositiveInverse: return Theme2.ubThemeColorForegroundPositiveInverse
        case .ubThemeColorForegroundPrimary: return Theme2.ubThemeColorForegroundPrimary
        case .ubThemeColorForegroundWarning: return Theme2.ubThemeColorForegroundWarning
        case .ubThemeColorForegroundWarningInverse: return Theme2.ubThemeColorForegroundWarningInverse
        case .ubThemeColorOutlineDisabled: return Theme2.ubThemeColorOutlineDisabled
        case .ubThemeColorOutlineError: return Theme2.ubThemeColorOutlineError
        case .ubThemeColorOutlineInfo: return Theme2.ubThemeColorOutlineInfo
        case .ubThemeColorOutlineNeutralHigh: return Theme2.ubThemeColorOutlineNeutralHigh
        case .ubThemeColorOutlineNeutralHighInverse: return Theme2.ubThemeColorOutlineNeutralHighInverse
        case .ubThemeColorOutlineNeutralLow: return Theme2.ubThemeColorOutlineNeutralLow
        case .ubThemeColorOutlineNeutralMedium: return Theme2.ubThemeColorOutlineNeutralMedium
        case .ubThemeColorOutlinePositive: return Theme2.ubThemeColorOutlinePositive
        case .ubThemeColorOutlinePrimary: return Theme2.ubThemeColorOutlinePrimary
        case .ubThemeColorOutlineWarning: return Theme2.ubThemeColorOutlineWarning
        }
    }

}

public enum GlobalTheme3ColorEnum: String, CaseIterable {
    case ubThemeColorBackgroundBaseline
    case ubThemeColorBackgroundBaselineInverse
    case ubThemeColorBackgroundDisabled
    case ubThemeColorBackgroundError
    case ubThemeColorBackgroundErrorInverse
    case ubThemeColorBackgroundInfo
    case ubThemeColorBackgroundInfoInverse
    case ubThemeColorBackgroundOverlay
    case ubThemeColorBackgroundPositive
    case ubThemeColorBackgroundPositiveInverse
    case ubThemeColorBackgroundPrimary
    case ubThemeColorBackgroundRaised
    case ubThemeColorBackgroundRaisedInverse
    case ubThemeColorBackgroundSunken
    case ubThemeColorBackgroundWarning
    case ubThemeColorBackgroundWarningInverse
    case ubThemeColorForegroundDisabled
    case ubThemeColorForegroundError
    case ubThemeColorForegroundErrorInverse
    case ubThemeColorForegroundInfo
    case ubThemeColorForegroundInfoInverse
    case ubThemeColorForegroundNeutralHigh
    case ubThemeColorForegroundNeutralHighInverse
    case ubThemeColorForegroundNeutralLow
    case ubThemeColorForegroundNeutralMedium
    case ubThemeColorForegroundOnPrimary
    case ubThemeColorForegroundPositive
    case ubThemeColorForegroundPositiveInverse
    case ubThemeColorForegroundPrimary
    case ubThemeColorForegroundWarning
    case ubThemeColorForegroundWarningInverse
    case ubThemeColorOutlineDisabled
    case ubThemeColorOutlineError
    case ubThemeColorOutlineInfo
    case ubThemeColorOutlineNeutralHigh
    case ubThemeColorOutlineNeutralHighInverse
    case ubThemeColorOutlineNeutralLow
    case ubThemeColorOutlineNeutralMedium
    case ubThemeColorOutlinePositive
    case ubThemeColorOutlinePrimary
    case ubThemeColorOutlineWarning
    
    public var associatedColor: UIColor {
        switch self {
        case .ubThemeColorBackgroundBaseline: return Theme3.ubThemeColorBackgroundBaseline
        case .ubThemeColorBackgroundBaselineInverse: return Theme3.ubThemeColorBackgroundBaselineInverse
        case .ubThemeColorBackgroundDisabled: return Theme3.ubThemeColorBackgroundDisabled
        case .ubThemeColorBackgroundError: return Theme3.ubThemeColorBackgroundError
        case .ubThemeColorBackgroundErrorInverse: return Theme3.ubThemeColorBackgroundErrorInverse
        case .ubThemeColorBackgroundInfo: return Theme3.ubThemeColorBackgroundInfo
        case .ubThemeColorBackgroundInfoInverse: return Theme3.ubThemeColorBackgroundInfoInverse
        case .ubThemeColorBackgroundOverlay: return Theme3.ubThemeColorBackgroundOverlay
        case .ubThemeColorBackgroundPositive: return Theme3.ubThemeColorBackgroundPositive
        case .ubThemeColorBackgroundPositiveInverse: return Theme3.ubThemeColorBackgroundPositiveInverse
        case .ubThemeColorBackgroundPrimary: return Theme3.ubThemeColorBackgroundPrimary
        case .ubThemeColorBackgroundRaised: return Theme3.ubThemeColorBackgroundRaised
        case .ubThemeColorBackgroundRaisedInverse: return Theme3.ubThemeColorBackgroundRaisedInverse
        case .ubThemeColorBackgroundSunken: return Theme3.ubThemeColorBackgroundSunken
        case .ubThemeColorBackgroundWarning: return Theme3.ubThemeColorBackgroundWarning
        case .ubThemeColorBackgroundWarningInverse: return Theme3.ubThemeColorBackgroundWarningInverse
        case .ubThemeColorForegroundDisabled: return Theme3.ubThemeColorForegroundDisabled
        case .ubThemeColorForegroundError: return Theme3.ubThemeColorForegroundError
        case .ubThemeColorForegroundErrorInverse: return Theme3.ubThemeColorForegroundErrorInverse
        case .ubThemeColorForegroundInfo: return Theme3.ubThemeColorForegroundInfo
        case .ubThemeColorForegroundInfoInverse: return Theme3.ubThemeColorForegroundInfoInverse
        case .ubThemeColorForegroundNeutralHigh: return Theme3.ubThemeColorForegroundNeutralHigh
        case .ubThemeColorForegroundNeutralHighInverse: return Theme3.ubThemeColorForegroundNeutralHighInverse
        case .ubThemeColorForegroundNeutralLow: return Theme3.ubThemeColorForegroundNeutralLow
        case .ubThemeColorForegroundNeutralMedium: return Theme3.ubThemeColorForegroundNeutralMedium
        case .ubThemeColorForegroundOnPrimary: return Theme3.ubThemeColorForegroundOnPrimary
        case .ubThemeColorForegroundPositive: return Theme3.ubThemeColorForegroundPositive
        case .ubThemeColorForegroundPositiveInverse: return Theme3.ubThemeColorForegroundPositiveInverse
        case .ubThemeColorForegroundPrimary: return Theme3.ubThemeColorForegroundPrimary
        case .ubThemeColorForegroundWarning: return Theme3.ubThemeColorForegroundWarning
        case .ubThemeColorForegroundWarningInverse: return Theme3.ubThemeColorForegroundWarningInverse
        case .ubThemeColorOutlineDisabled: return Theme3.ubThemeColorOutlineDisabled
        case .ubThemeColorOutlineError: return Theme3.ubThemeColorOutlineError
        case .ubThemeColorOutlineInfo: return Theme3.ubThemeColorOutlineInfo
        case .ubThemeColorOutlineNeutralHigh: return Theme3.ubThemeColorOutlineNeutralHigh
        case .ubThemeColorOutlineNeutralHighInverse: return Theme3.ubThemeColorOutlineNeutralHighInverse
        case .ubThemeColorOutlineNeutralLow: return Theme3.ubThemeColorOutlineNeutralLow
        case .ubThemeColorOutlineNeutralMedium: return Theme3.ubThemeColorOutlineNeutralMedium
        case .ubThemeColorOutlinePositive: return Theme3.ubThemeColorOutlinePositive
        case .ubThemeColorOutlinePrimary: return Theme3.ubThemeColorOutlinePrimary
        case .ubThemeColorOutlineWarning: return Theme3.ubThemeColorOutlineWarning
        }
    }
}


struct SectionData: Identifiable {
    let id = UUID()
    let title: String
    let items: [String]
}

let sections: [SectionData] = [
    SectionData(title: "Atoms", items: ["Colors", "Fonts", "Icons"]),
    SectionData(title: "Molecules", items: ["UBText", "UBButton", "UBCardContainer"])
]

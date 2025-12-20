//
//  UBImages.swift
//
//
//  Created by Rakesh Kumar on 20/12/25.
//

import Foundation
import UIKit
import SwiftUI

public struct UBImageConstants {
    public static let imageNotFound = "image_not_found"
    public static let bundlePath = "UltaDesignSystem.bundle"
}

public protocol UBImages {
    func getImage(name: String) -> UIImage?
}

public extension UBImages {
    
    /// Function to get a UIImage form the UltaDesignSystem asset catalogue
    /// - Parameter name: Image name
    /// - Returns: Optional UIImage for UIKit
    func getImage(name: String) -> UIImage? {
        let imageName: String = name.isEmpty ? UBImageConstants.imageNotFound : name
        let bundle: Bundle = Bundle(for: UBGlobal.self)
        
        guard let resourceURL: URL = bundle.resourceURL?.appendingPathComponent(UBImageConstants.bundlePath),
              let resourceBundle: Bundle = Bundle(url: resourceURL) else { return nil }
        
        return UIImage(named: imageName, in: resourceBundle, compatibleWith: nil)
    }
    
    /// Function to get a Image form the UltaDesignSystem asset catalogue
    /// - Parameter name: Image name
    /// - Returns: Optional Image for SwiftUI
    @available(iOS 13.0, *)
    func getImageView(name: String) -> Image? {
        let imageName: String = name.isEmpty ? UBImageConstants.imageNotFound : name
        let bundle: Bundle = Bundle(for: UBGlobal.self)
        
        guard let resourceURL: URL = bundle.resourceURL?.appendingPathComponent(UBImageConstants.bundlePath) else { return nil }
        guard let resourceBundle: Bundle = Bundle(url: resourceURL) else { return nil }
        
        if let uiImage = UIImage(named: imageName, in: resourceBundle, compatibleWith: nil) {
            return Image(uiImage: uiImage)
        }
        
        return nil
    }
}

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
}

public protocol UBImages {
    func getImage(name: String) -> UIImage?
}

public extension UBImages {
    
    /// Returns a UIImage from the SPM asset catalog
    func getImage(name: String) -> UIImage? {
        let imageName = name.isEmpty ? UBImageConstants.imageNotFound: name
        return UIImage(named: imageName, in: .module, compatibleWith: nil)
    }
    
    /// Returns a SwiftUI Image from the SPM asset catalog
    @available(iOS 13.0, *)
    func getImageView(name: String) -> Image? {
        let imageName = name.isEmpty ? UBImageConstants.imageNotFound: name
        
        guard let uiImage = UIImage(named: imageName, in: .module, compatibleWith: nil) else {
            return nil
        }
        return Image(uiImage: uiImage)
    }
}

//
//  SwiftUIView.swift
//  
//
//  Created by Rakesh Kumar on 03/12/25.
//

import SwiftUI

/// Delegate to return the url provided in the LinkAttributes
public protocol LinkDelegate: AnyObject {
    func didTapOnLink(url: URL?)
}

public struct TextAttributes {
    public var text: String
    // Colors can be selected from the list present in TextColorType enum. Default is neutralHigh
    public var color: TextColorType
    // Font sizes can be selected from the list present in TextFontSize enum. Default is medium
    public var fontSize: TextFontSize
    // Text alignment can be start(left), center or end(right). Default is start(left)
    public var textAlign: TextAlign
    // This is for number of lines. Default value is 0
    public var maxlines: Int
    // It supports regular, semiBold and Bold Font Weights. Default is regular
    public var fontWeight: TextFontWeight
    // It supports small, medium and large line heights. Default is medium
    public var lineHeight: LineHeight
    // Bool value to support font decoration of strike through text
    public var textDecoration: TextDecoration
    // Font family for the text to be displayed
    public var fontFamily: UBTextFontFamily = .nunitoSans
    
    /// Initialize the various attributes the UBText component supports.
    /// - Parameters:
    ///   - text: The string to be displayed on the UBText component.
    ///   - color: Colors can be selected from the list present in TextColorType enum. Default is neutralHigh.
    ///   - fontSize: Font sizes can be selected from the list present in TextFontSize enum. Default is medium.
    ///   - textAlign: Text alignment can be start(left), center or end(right). Default is start(left).
    ///   - maxlines: This is for number of lines. Default value is 0.
    ///   - fontWeight: It supports regular, semiBold and Bold Font Weights. Default is regular.
    ///   - lineHeight: It supports small, medium and large line heights. Default is medium.
    ///   - textDecoration: Bool value to support font decoration of strike through text.
    ///   - fontFamily: Enum value to display font family for text.
    public init(
        text: String,
        color: TextColorType = .neutralHigh,
        fontSize: TextFontSize = .medium,
        textAlign: TextAlign = .start,
        maxlines: Int = 0,
        fontWeight: TextFontWeight = .regular,
        lineHeight: LineHeight = .medium,
        textDecoration: TextDecoration = .none,
        fontFamily: UBTextFontFamily = .nunitoSans
    ) {
        self.text = text
        self.color = color
        self.fontSize = fontSize
        self.textAlign = textAlign
        self.maxlines = maxlines
        self.fontWeight = fontWeight
        self.lineHeight = lineHeight
        self.textDecoration = textDecoration
        self.fontFamily = fontFamily
    }
}

public struct LinkAttributes: Hashable {
    public var text: String
    // Colors can be selected from the list present in LinkColorType enum. Default is neutralHigh
    public var color: LinkColorType
    // Font sizes can be selected from the list present in TextFontSize enum. Default is medium
    public var fontSize: TextFontSize
    // It supports regular, semiBold and Bold Font Weights. Default is semiBold
    public var fontWeight: TextFontWeight
    // Text alignment can be start(left), center or end(right). Default is start(left)
    public var textAlign: TextAlign
    // If url is provided in the link attriburtes then the same URL is returned on tap of the link through the delegate method. Addtionally an identifier can be provided in place of url if navigation is to be done within the app
    public var url: String? = nil
    // If options is provided this property allows you to specify the which range to search for the text. when we have multiple occurence
    public var options: String.CompareOptions? = nil
    
    public var linkAction: ((String) -> Void)? = nil
    
    public init(
        text: String,
        color: LinkColorType = .neutralHigh,
        fontSize: TextFontSize = .medium,
        fontWeight: TextFontWeight = .semiBold,
        textAlign: TextAlign = .start,
        url: String? = nil,
        options: String.CompareOptions? = nil,
        linkAction: ((String) -> Void)? = nil
    ) {
        self.text = text
        self.color = color
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.textAlign = textAlign
        self.url = url
        self.options = options
        self.linkAction = linkAction
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(options?.rawValue) // Use the raw value for hashing
    }
    
    public static func == (lhs: LinkAttributes, rhs: LinkAttributes) -> Bool {
        return lhs.text == rhs.text &&
        lhs.color == rhs.color &&
        lhs.fontSize == rhs.fontSize &&
        lhs.fontWeight == rhs.fontWeight &&
        lhs.textAlign == rhs.textAlign &&
        lhs.url == rhs.url &&
        lhs.options == rhs.options
    }
}

@available(iOS 15.0, *)
public struct UBText: View {
    public weak var linkDelegate: LinkDelegate?
    private var textAttribute: TextAttributes
    private var linkAttributes: [LinkAttributes] = []
    private var theme: UBTheme
    private var substringTextAttributes: [TextAttributes]
    
    public init(
        theme: UBTheme = UBTheme.current,
        textAttribute: TextAttributes,
        linkAttributes: [LinkAttributes]? = nil,
        substringTextAttributes: [TextAttributes] = []
    ) {
        self.theme = theme
        self.textAttribute = textAttribute
        if let linkAttributes = linkAttributes {
            self.linkAttributes = linkAttributes
        }
        self.substringTextAttributes = substringTextAttributes
    }
    
    public var body: some View {
        Text(buildAttributedString())
            .font(getFont())
            .foregroundStyle(textAttribute.color.getForegroundColor(theme: theme))
            .frame(maxWidth: .infinity, alignment: textAttribute.textAlign.getFrameAlignment())
            .lineSpacing(textAttribute.lineHeight.getLineHeight(fontFamily: textAttribute.fontFamily))
            .lineLimit(textAttribute.maxlines == 0 ? nil : Int(textAttribute.maxlines))
            .fixedSize(horizontal: false, vertical: textAttribute.maxlines == 0 ? true : false)
            .gesture(TapGesture().onEnded {
                handleTap()
            })
    }
    
    private func buildAttributedString() -> AttributedString {
        var attributedString = applySubstringAttributes()
        switch textAttribute.textDecoration {
        case .strikethrough:
            attributedString.strikethroughStyle = .single
        case .underline:
            attributedString.underlineStyle = .single
        case .italic:
            attributedString.font = .italic(.system(size: textAttribute.fontSize.getFontSize(fontFamily: .nunitoSans)))()
        case .none:
            break
        }
        for link in linkAttributes {
            if let range = attributedString.range(of: link.text) {
                attributedString[range].foregroundColor = link.color.getColor(theme: UBTheme.current)
                attributedString[range].underlineStyle = .single
                attributedString[range].underlineColor = link.color.getColor(theme: UBTheme.current)
            }
        }
        return attributedString
    }
    
    private func getFont() -> Font {
        switch textAttribute.fontFamily {
        case .nunitoSans:
            return .custom(textAttribute.fontWeight.getFontWeight(for: UBGlobal.fontFamilyNunitoSans), size: textAttribute.fontSize.getFontSize(fontFamily: .nunitoSans))
        }
    }
    
    private func applySubstringAttributes() -> AttributedString {
        var attributedString = AttributedString(textAttribute.text)
        if !substringTextAttributes.isEmpty {
            for attribute in substringTextAttributes {
                guard let range = attributedString.range(of: attribute.text) else { continue }
                
                attributedString[range].font = .custom(
                    attribute.fontWeight.getFontWeight(for: UBGlobal.fontFamilyNunitoSans),
                    size: attribute.fontSize.getFontSize(fontFamily: attribute.fontFamily)
                )
                
                switch attribute.textDecoration {
                case .strikethrough:
                    attributedString[range].strikethroughStyle = .single
                case .underline:
                    attributedString[range].underlineStyle = .single
                case .italic:
                    attributedString[range].font = .italic(.system(size: attribute.fontSize.getFontSize(fontFamily: attribute.fontFamily)))()
                case .none:
                    break
                }
                attributedString[range].foregroundColor = attribute.color.getForegroundColor(theme: theme)
            }
        }
        return attributedString
    }
    
    private func handleTap() {
        guard linkAttributes.count > 0 else { return }
        for link in linkAttributes {
            if textAttribute.text.contains(link.text), let urlString = link.url, let url = URL(string: urlString) {
                linkDelegate?.didTapOnLink(url: url)
            }
        }
    }
}

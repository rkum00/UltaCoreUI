//
//  UBTextField.swift
//
//
//  Created by Rakesh Kumar on 24/12/25.
//

import SwiftUI

@available(iOS 15.0, *)

// MARK: - UBTextField
public struct UBTextField: View, UBImages {
    
    // MARK: Properties
    let helperText: String?
    let maxCharacters: Int?
    let placeHolderText: String?
    let variant: TextFieldVariant
    let textFieldAccessibility: String?
    let keyboardType: UBKeyboardType
    let size: UBTextFieldSize
    let theme: UBTheme
    
    var leadingIcon: Image?
    var trailingIcon: Image?
    
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    // MARK: Initializer
    public init(
        text: Binding<String>,
        helperText: String? = nil,
        maxCharacters: Int? = nil,
        placeHolderText: String?,
        variant: TextFieldVariant,
        leading: Slot? = nil,
        trailing: Slot? = nil,
        textFieldAccessibility: String?,
        keyboardType: UBKeyboardType = .default,
        size: UBTextFieldSize = .regular,
        theme: UBTheme = .current
    ) {
        self._text = text
        self.helperText = helperText
        self.maxCharacters = maxCharacters
        self.placeHolderText = placeHolderText
        self.variant = variant
        self.textFieldAccessibility = textFieldAccessibility
        self.keyboardType = keyboardType
        self.size = size
        self.theme = theme
        
        if let leadingImage = getSlotImage(slot: leading) {
            self.leadingIcon = Image(uiImage: leadingImage)
        }
        
        if let trailingImage = getSlotImage(slot: trailing) {
            self.trailingIcon = Image(uiImage: trailingImage)
        }
    }
    
    // MARK: Body
    public var body: some View {
        VStack(alignment: .leading, spacing: UBGlobal.space100) {
            
            HStack(spacing: UBGlobal.space200) {
                
                if let leadingIcon {
                    leadingIcon
                        .renderingMode(.template)
                        .foregroundColor(.gray)
                }
                
                floatingTextField
                
                if let trailingIcon {
                    trailingIcon
                        .renderingMode(.template)
                        .foregroundColor(.gray)
                }
            }
            .frame(height: size.height)
            .padding(.horizontal, size.horizontalPadding)
            .padding(.top, size.topPadding(for: variant))
            .padding(.bottom, size.bottomPadding)
            .overlay(borderView)
            
            footerView
        }
        .fixedSize(horizontal: false, vertical: true)
    }
    
    // MARK: Floating TextField
    private var floatingTextField: some View {
        ZStack(alignment: .leading) {
            
            if let placeHolderText {
                UBText(textAttribute: TextAttributes(text: placeHolderText, color: isFocused ? .neutralHigh : .neutralLow))
                    .scaleEffect(shouldFloat ? 0.85 : 1.0, anchor: .leading)
                    .offset(y: shouldFloat ? size.floatingOffset : UBGlobal.space0)
                    .animation(.easeOut(duration: 0.2), value: shouldFloat)
            }
            
            TextField("", text: $text)
                .focused($isFocused)
                .keyboardType(keyboardType.uiKeyboardType)
                .accessibilityIdentifier(textFieldAccessibility ?? "")
                .padding(.top, textFieldTopPadding)
                .onChange(of: text) { newValue in
                    guard let maxCharacters else { return }
                    if newValue.count > maxCharacters {
                        text = String(newValue.prefix(maxCharacters))
                    }
                }
        }
    }
    
    // MARK: Border
    private var borderView: some View {
        RoundedRectangle(
            cornerRadius: variant == .rounded
            ? UBGlobal.borderRadius200
            : UBGlobal.borderRadius0
        )
        .stroke(
            variant.getBorderColor(theme: theme),
            lineWidth: UBGlobal.borderWidth100
        )
    }
    
    // MARK: Footer
    private var footerView: some View {
        HStack {
            if let helperText {
                UBText(textAttribute: TextAttributes(text: helperText, color: .error, fontSize: .small))
            }
            Spacer()
            if let maxCharacters {
                UBText(textAttribute: TextAttributes(text: "\(text.count)/\(maxCharacters)", color: .neutralLow, fontSize: .small, textAlign: .end))
            }
        }
    }
    
    // MARK: Helpers
    private var shouldFloat: Bool {
        isFocused || !text.isEmpty
    }
    
    private var textFieldTopPadding: CGFloat {
        shouldFloat ? size.floatingTextPadding : UBGlobal.space0
    }
    
    private func getSlotImage(slot: Slot?) -> UIImage? {
        guard let imageName = slot?.imageName else { return nil }
        return getImage(name: imageName)
    }
}

//
//  UBTextField.swift
//
//
//  Created by Rakesh Kumar on 24/12/25.
//

import SwiftUI

@available(iOS 15.0, *)
struct UBTextField: View, UBImages {
    
    let helperText: String?
    let maxCharacters: Int?
    let placeHolderText: String?
    let variant: TextFieldVariant
    let textFieldAccessibility: String?
    let theme: UBTheme
    
    var leadingIcon: Image?
    var trailingIcon: Image?
    
    @Binding var text: String
    
    // MARK: - Initializer
    init(
        text: Binding<String>,
        helperText: String? = nil,
        maxCharacters: Int? = nil,
        placeHolderText: String?,
        variant: TextFieldVariant,
        leading: Slot? = nil,
        trailing: Slot? = nil,
        textFieldAccessibility: String?,
        theme: UBTheme = .current
    ) {
        self._text = text
        self.helperText = helperText
        self.maxCharacters = maxCharacters
        self.placeHolderText = placeHolderText
        self.variant = variant
        self.textFieldAccessibility = textFieldAccessibility
        self.theme = theme
        
        if let leadingImage = getSlotImage(slot: leading) {
            self.leadingIcon = Image(uiImage: leadingImage)
        }
        
        if let trailingImage = getSlotImage(slot: trailing) {
            self.trailingIcon = Image(uiImage: trailingImage)
        }
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: UBGlobal.space100) {
            HStack(spacing: UBGlobal.space200) {
                
                if let leadingIcon {
                    leadingIcon
                        .renderingMode(.template)
                        .foregroundColor(.gray)
                }
                TextField(placeHolderText ?? "", text: $text)
                    .accessibilityIdentifier(textFieldAccessibility ?? "")
                    .onChange(of: text) { newValue in
                        guard let maxCharacters else { return }
                        if newValue.count > maxCharacters {
                            text = String(newValue.prefix(maxCharacters))
                        }
                    }
                if let trailingIcon {
                    trailingIcon
                        .renderingMode(.template)
                        .foregroundColor(.gray)
                }
            }
            .padding(UBGlobal.space300)
            .overlay(
                RoundedRectangle(cornerRadius: UBGlobal.borderRadius200)
                    .stroke(variant.getBorderColor(theme: theme), lineWidth: UBGlobal.borderWidth100)
            )
            HStack {
                if let helperText {
                    Text(helperText)
                        .foregroundColor(variant.getTextColor(theme: theme))
                        .font(.caption)
                }
                Spacer()
                if let maxCharacters {
                    Text("\(text.count)/\(maxCharacters)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    // MARK: - Helpers
    private func getSlotImage(slot: Slot?) -> UIImage? {
        guard let imageName = slot?.imageName else { return nil }
        return getImage(name: imageName)
    }
}

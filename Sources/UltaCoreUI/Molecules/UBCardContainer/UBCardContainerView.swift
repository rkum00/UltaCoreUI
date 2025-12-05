//
//  UBCardContainerView.swift
//
//
//  Created by Rakesh Kumar on 05/12/25.
//

import SwiftUI

@available(iOS 13.0, *)

public struct UBCardContainerView<Content: View>: View {
    var size: UBCardSize
    var type: UBCardType
    var state: UBCardState
    var shape: UBCardShape
    var axis: UBCardAxis
    var theme: UBTheme = .current
    var content: () -> Content
    
    public init(size: UBCardSize,
                type: UBCardType,
                state: UBCardState,
                shape: UBCardShape,
                axis: UBCardAxis,
                theme: UBTheme = .current,
                content: @escaping () -> Content) {
        self.size = size
        self.type = type
        self.state = state
        self.shape = shape
        self.axis = axis
        self.theme = theme
        self.content = content
    }
    
    // MARK: - Body
    public var body: some View {
        ZStack {
            // State layer (background color and opacity)
            state.getBackgroundColor(theme: theme)
                .clipShape(RoundedRectangle(cornerRadius: shape.cornerRadius))
            
            // Shape layer (border and shadow)
            RoundedRectangle(cornerRadius: shape.cornerRadius)
                .stroke(type.borderColor, lineWidth: type == .outlined ? 1 : 0)
                .shadow(radius: type.shadowRadius)
            
            // Content layer
            Group {
                switch axis {
                case .horizontal:
                    HStack { content() }
                case .vertical:
                    VStack { content() }
                }
            }
            .padding()
            .opacity(state == .disabled ? 0.6 : 1)
        }
        .frame(width: size.getWidth(), height: size.getHeight())
    }
}

//
//  UBCardContainerView.swift
//
//
//  Created by Rakesh Kumar on 05/12/25.
//

import SwiftUI

@available(iOS 13.0, *)

/*
public struct UBCardContainerView<Content: View>: View {
    var size: UBCardSize
    var type: UBCardType
    var state: UBCardState
    var shape: UBCardShape
    var axis: UBCardAxis
    var theme: UBTheme
    var contentPadding: UBCardPadding
    var contentPaddingEdge: UBCardPaddingEdge
    var content: () -> Content
    
    public init(size: UBCardSize,
                type: UBCardType,
                state: UBCardState,
                shape: UBCardShape,
                axis: UBCardAxis,
                theme: UBTheme = .current,
                contentPadding: UBCardPadding,
                contentPaddingEdge: UBCardPaddingEdge = .all,
                content: @escaping () -> Content) {
        self.size = size
        self.type = type
        self.state = state
        self.shape = shape
        self.axis = axis
        self.theme = theme
        self.contentPadding = contentPadding
        self.contentPaddingEdge = contentPaddingEdge
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
            .padding(UBCardPadding.insets(edge: contentPaddingEdge, size: contentPadding))
            .opacity(state == .disabled ? 0.6 : 1)
        }
        .frame(width: size.getWidth(), height: size.getHeight())
    }
}
*/

@available(iOS 13.0, *)
public struct UBCardContainerView<Content: View>: View {
    let size: UBCardSize
    let type: UBCardType
    let state: UBCardState
    let shape: UBCardShape
    let axis: UBCardAxis
    let theme: UBTheme
    let contentPadding: UBCardPadding
    let contentPaddingEdge: UBCardPaddingEdge
    let outlineColor: UBCardOutlineColor
    let content: () -> Content
    
    public init(size: UBCardSize,
                type: UBCardType,
                state: UBCardState,
                shape: UBCardShape,
                axis: UBCardAxis,
                theme: UBTheme = .current,
                contentPadding: UBCardPadding,
                contentPaddingEdge: UBCardPaddingEdge = .all,
                outlineColor: UBCardOutlineColor = .primary,
                content: @escaping () -> Content) {
        self.size = size
        self.type = type
        self.state = state
        self.shape = shape
        self.axis = axis
        self.theme = theme
        self.contentPadding = contentPadding
        self.contentPaddingEdge = contentPaddingEdge
        self.outlineColor = outlineColor
        self.content = content
    }
    
    var shapeView: some InsettableShape {
        RoundedRectangle(cornerRadius: shape.cornerRadius)
    }
    
    public var body: some View {
        ZStack {
            // Background
            state.getBackgroundColor(theme: theme)
                .clipShape(shapeView)
            
            // Border
            shapeView
                .stroke(outlineColor.getColor(theme: theme),
                        lineWidth: type.lineWidth)
            
            // Shadow
            shapeView
                .fill(Color.clear)
                .shadow(radius: type.shadowRadius)
            
            // Content layout
            Group {
                if axis == .horizontal {
                    HStack(spacing: contentPadding.value) { content() }
                } else {
                    VStack(spacing: contentPadding.value) { content() }
                }
            }
            .padding(UBCardPadding.insets(edge: contentPaddingEdge,
                                         size: contentPadding))
            .opacity(state.opacityValue)
        }
        .frame(width: size.getWidth(),
               height: size.getHeight())
    }
}


//
//  UBLoaderView.swift
//
//
//  Created by Rakesh Kumar on 17/12/25.
//

import SwiftUI

@available(iOS 15.0, *)
public struct UBLoaderView: View {
    let theme: UBTheme
    let color: UBLoaderColor
    let size: UBLoaderSize
    let loaderLabel: UBText?
    
    public init(
        theme: UBTheme = .current,
        color: UBLoaderColor = .primary,
        size: UBLoaderSize = .large,
        labelText: String? = nil
    ) {
        self.theme = theme
        self.color = color
        self.size = size
        
        if let labelText, !labelText.isEmpty {
            self.loaderLabel = UBText(
                textAttribute: TextAttributes(
                    text: labelText,
                    color: color.getTextColor(),
                    fontSize: size.getTextSize(),
                    textAlign: .center,
                    maxlines: 2,
                    fontWeight: .semiBold
                )
            )
        } else {
            self.loaderLabel = nil
        }
    }
    
    public var body: some View {
        VStack(spacing: loaderLabel == nil ? UBGlobal.space0 : size.getLabelSpacing()) {
            loaderCircle
            loaderLabel
        }
    }
    
    private var loaderCircle: some View {
        let dimension = size.width
        let lineWidth = size.borderWidth
        let indicatorColor = color.getIndicatorColor(theme: theme)
        let trackColor = color.getTrackColor()
        
        return TimelineView(.animation) { timeline in
            let angle = timeline.date.timeIntervalSinceReferenceDate
                .truncatingRemainder(dividingBy: 1) * 360
            
            Circle()
                .stroke(trackColor, lineWidth: lineWidth)
                .overlay {
                    Circle()
                        .trim(from: 0, to: 0.25)
                        .stroke(
                            indicatorColor,
                            style: StrokeStyle(
                                lineWidth: lineWidth,
                                lineCap: .round
                            )
                        )
                        .rotationEffect(.degrees(angle))
                }
                .frame(width: dimension, height: dimension)
        }
        .padding()
    }
}

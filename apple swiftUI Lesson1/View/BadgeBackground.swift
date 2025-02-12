//
//  BadgeBackground.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 11/02/2025.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader{ geometry in
            Path { path in //add a Path shape to the badge and apply the fill() modifier to turn the shape into a view.
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    ) //The move(to:) method moves the drawing cursor within the bounds of a shape
                )

                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(x: width * segment.line.x + xOffset,
                                    y: height * segment.line.y)
                    )

                    path.addQuadCurve(
                        to: CGPoint(x: width * segment.curve.x + xOffset,
                                    y: height * segment.curve.y),
                        control: CGPoint(x: width * segment.control.x + xOffset,
                                         y: height * segment.control.y)
                    )
                }
            }
            .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        .aspectRatio(1, contentMode: .fit)
    }

    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}
//You use paths to combine lines, curves, and other drawing primitives to form more complex shapes like the badge’s hexagonal background.
//Wrap the path in a GeometryReader so the badge can use the size of its containing view, which defines the size instead of hard-coding the value (100). Using the smallest (min()) of the geometry’s two dimensions preserves the aspect ratio of the badge when its containing view isn’t square.

#Preview {
    BadgeBackground()
}

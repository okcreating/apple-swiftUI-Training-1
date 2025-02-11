//
//  BadgeBackground.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 11/02/2025.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        Path { path in //add a Path shape to the badge and apply the fill() modifier to turn the shape into a view.
            var width: CGFloat = 100.0
            let height = width
                path.move(
                    to: CGPoint(
                        x: width * 0.95,
                        y: height * 0.20
                    ) //The move(to:) method moves the drawing cursor within the bounds of a shape
                )

            HexagonParameters.segments.forEach { segment in
                path.addLine(
                    to: CGPoint(x: width * segment.line.x,
                                y: height * segment.line.y)
                )
            }
        }
        .fill(.black)
    }
}
//You use paths to combine lines, curves, and other drawing primitives to form more complex shapes like the badge’s hexagonal background.

#Preview {
    BadgeBackground()
}

//
//  RotateBadgeSymbol.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 13/02/2025.
//

import SwiftUI

struct RotateBadgeSymbol: View {
    let angle: Angle

    var body: some View {
       BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotateBadgeSymbol(angle: Angle(degrees: 5))
}

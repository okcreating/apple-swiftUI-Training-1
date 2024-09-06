//
//  CircleImage.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 05/09/2024.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 5)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage()
}

//
//  PageView.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 28/02/2025.
//
//Next, you’ll create a custom view to present your UIViewControllerRepresentable view.

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]

    var body: some View {
        PageViewController(pages: pages)
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}

#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
}

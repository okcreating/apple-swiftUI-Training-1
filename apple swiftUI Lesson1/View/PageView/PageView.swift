//
//  PageView.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 28/02/2025.
//
//Next, you’ll create a custom view to present your UIViewControllerRepresentable view.

import SwiftUI
// You’ll use UIPageViewController to display a carousel of SwiftUI views, and use state variables and bindings to coordinate data updates throughout the user interface.
struct PageView<Page: View>: View {
    var pages: [Page]

    var body: some View {
        PageViewController(pages: pages)
            .aspectRatio(3 / 2, contentMode: .fit)
        //Create a new SwiftUI view file, named PageView.swift, and update the PageView type to declare PageViewController as a child view.The preview fails because Xcode can’t infer a type for Page.
    }
}

#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
}

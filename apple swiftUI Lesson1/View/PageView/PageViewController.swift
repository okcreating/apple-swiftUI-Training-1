//
//  PageViewController.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 28/02/2025.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
//The page view controller stores an array of Page instances, which must be a type of View. These are the pages you use to scroll between landmarks.
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)

        return pageViewController
        //Add a makeUIViewController(context:) method that creates a UIPageViewController with the desired configuration. SwiftUI calls this method a single time when it’s ready to display the view, and then manages the view controller’s life cycle.
    }

    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
    }
    //Add an updateUIViewController(_:context:) method that calls setViewControllers(_:direction:animated:) to provide a view controller for display. For now, you create the UIHostingController that hosts the page SwiftUI view on every update. Later, you’ll make this more efficient by initializing the controller only once for the life of the page view controller.
}

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

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    //SwiftUI calls this makeCoordinator() method before makeUIViewController(context:), so that you have access to the coordinator object when configuring your view controller. tip: You can use this coordinator to implement common Cocoa patterns, such as delegates, data sources, and responding to user events via target-action.
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        //Add the coordinator as the data source of the UIPageViewController.

        return pageViewController
        //Add a makeUIViewController(context:) method that creates a UIPageViewController with the desired configuration. SwiftUI calls this method a single time when it’s ready to display the view, and then manages the view controller’s life cycle.
    }

    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([context.coordinator.controllers[0]], direction: .forward, animated: true)
    }
    //Add an updateUIViewController(_:context:) method that calls setViewControllers(_:direction:animated:) to provide a view controller for display. For now, you create the UIHostingController that hosts the page SwiftUI view on every update. Later, you’ll make this more efficient by initializing the controller only once for the life of the page view controller.

    class Coordinator: NSObject, UIPageViewControllerDataSource {
        var parent: PageViewController
        var controllers = [UIViewController]()
        //The coordinator is a good place to store these controllers, because the system initializes them only once, and before you need them to update the view controller.

        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0)}
        }

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else { return nil }

            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else { return nil }

            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        //Add UIPageViewControllerDataSource conformance to the Coordinator type, and implement the two required methods.These two methods establish the relationships between view controllers, so that you can swipe back and forth between them.
    }
    //A SwiftUI view that represents a UIKit view controller can define a Coordinator type that SwiftUI manages and provides as part of the representable view’s context. Declare a nested Coordinator class inside PageViewController.SwiftUI manages your UIViewControllerRepresentable type’s coordinator, and provides it as part of the context when calling the methods you created above.
}
//the PageViewController uses a UIPageViewController to show content from a SwiftUI view.

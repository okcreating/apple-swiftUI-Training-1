//
//  CategoryHome.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 19/02/2025.
//

//The category view for Landmarks shows a vertically scrolling list of horizontally scrolling landmarks. As you build this view and connect it to your existing views, you’ll explore how composed views can adapt to different device sizes and orientations.

import SwiftUI

struct CategoryHome: View {

    @Environment(ModelData.self) var modelData

    var body: some View {
        NavigationSplitView {
            //Add a NavigationSplitView to host the different categories. You use navigation split views along with NavigationLink instances and related modifiers to build hierarchical navigation structures in your app.
            List {
                ForEach(modelData.categories.keys.sorted(), id:\.self) { key in
                    Text(key)
                }
            }
                .navigationTitle("Featured") //Set the title of the navigation bar to Featured. The view showcases one or more featured landmarks at the top.
                } detail: {
                    Text("Select a Landmark")
                }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}

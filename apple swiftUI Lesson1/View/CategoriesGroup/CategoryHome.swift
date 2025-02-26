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
    @State private var showingProfile = false

    var body: some View {
        NavigationSplitView {
            //Add a NavigationSplitView to host the different categories. You use navigation split views along with NavigationLink instances and related modifiers to build hierarchical navigation structures in your app.
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(modelData.categories.keys.sorted(), id:\.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets()) //Set the edge insets to zero on both kinds of landmark previews so the content can extend to the edges of the display.
            }
                .listStyle(.inset) // Add the listStyle modifier to pick a list style that better suits the content.
                .navigationTitle("Featured") //Set the title of the navigation bar to Featured. The view showcases one or more featured landmarks at the top.
                .toolbar { //add a user profile button to the navigation bar using the toolbar modifier, and present the ProfileHost view when the user taps it.
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
                .sheet(isPresented: $showingProfile) {
                    ProfileHost()
                        .environment(modelData)
                }
                } detail: {
                    Text("Select a Landmark")
                }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}

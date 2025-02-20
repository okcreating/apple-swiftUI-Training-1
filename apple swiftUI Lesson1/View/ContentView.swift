//
//  ContentView.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 01/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured

    enum Tab {
        case featured
        case list
    }

    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)

            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
        //The tag(_:) modifier on each of the views matches one of the possible values that the selection property can take so the TabView can coordinate which view to display when the user makes a selection in the user interface.
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}

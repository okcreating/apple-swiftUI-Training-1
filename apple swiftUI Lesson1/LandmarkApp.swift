//
//  apple_swiftUI_Lesson1App.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 01/09/2024.
//

import SwiftUI

@main
struct LandmarkApp: App {

    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}

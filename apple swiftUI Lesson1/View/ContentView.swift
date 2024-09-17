//
//  ContentView.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 01/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}

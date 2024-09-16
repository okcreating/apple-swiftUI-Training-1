//
//  LandmarkList.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 16/09/2024.
//

import SwiftUI


struct LandmarkList: View {
    var body: some View {
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)

                }
    }
}


#Preview {
    LandmarkList()
}

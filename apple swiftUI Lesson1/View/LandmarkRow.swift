//
//  LandmarkRow.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 16/09/2024.
//

import SwiftUI


struct LandmarkRow: View {
    var landmark: Landmark


    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()

            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}



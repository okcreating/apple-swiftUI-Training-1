//
//  LandmarkDetail.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 16/09/2024.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark

    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                        .frame(height: 300)

            CircleImage(image: landmark.image)
                        .offset(y: -130)
                        .padding(.bottom, -130)

            VStack(alignment: .leading) {
                        Text(landmark.name)
                            .font(.title)

                        HStack {
                            Text(landmark.park)
                            Spacer()
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                        Divider()

                        Text("About \(landmark.name)")
                            .font(.title2)
                        Text(landmark.description)
                    }
                    .padding()

                }
                .navigationTitle(landmark.name)
                .navigationBarTitleDisplayMode(.inline)
        }
}

#Preview {
    LandmarkDetail(landmark: landmarks[0])
}

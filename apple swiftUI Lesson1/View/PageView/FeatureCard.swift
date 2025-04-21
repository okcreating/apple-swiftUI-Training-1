//
//  FeatureCard.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 28/02/2025.
//

//Add a new SwiftUI view file, named FeatureCard.swift that displays the landmark’s feature image.


import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark

    var body: some View {
        landmark.featureImage?
            .resizable()
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}

struct TextOverlay: View {
    var landmark: Landmark

    var gradient: LinearGradient {
        .linearGradient(colors: [.black.opacity(0.6), .black.opacity(0)],
                        startPoint: .bottom,
                        endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    FeatureCard(landmark: ModelData().features[0])
        .aspectRatio(3 / 2, contentMode: .fit)
    //Include the aspect ratio modifier so it mimics the aspect ratio of the view where FeatureCard will eventually preview later.
}

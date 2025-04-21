//
//  CategoryItem.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 20/02/2025.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark

    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original) //Text that you pass as the label for a navigation link renders using the environment’s accent color, and images may render as template images. You can modify either behavior to best suit your design.
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)

            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}

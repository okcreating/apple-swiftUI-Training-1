//
//  CategoryRow.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 20/02/2025.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                            //Text that you pass as the label for a navigation link renders using the environment’s accent color, and images may render as template images. You can modify either behavior to best suit your design. Change the navigation appearance of the category items by applying the renderingMode(_:) and foregroundStyle(_:) modifiers (in CategoryItem view objects)
                        }
                    }

                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return CategoryRow(
        categoryName: landmarks[0].category.rawValue, items: Array(landmarks.prefix(3))
    )
  //  CategoryRow()
}

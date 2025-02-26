//
//  ProfileHost.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 25/02/2025.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default //You set the draftProfile here to a default profile as a placeholder until you introduce the model data profile later on.
    
    var body: some View {
        //Text("Profile for: \(draftProfile.username)")
        VStack(alignment: .leading, spacing: 10) {
            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
}

//The ProfileHost view will host both a static, summary view of profile information and an edit mode.

#Preview {
    ProfileHost()
        .environment(ModelData())
}

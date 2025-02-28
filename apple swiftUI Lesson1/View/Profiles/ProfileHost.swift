//
//  ProfileHost.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 25/02/2025.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    //Add an Environment view property that keys off of the environment’s \.editMode. SwiftUI provides storage in the environment for values you can access using the @Environment property wrapper. Earlier you used @Environment to retrieve a class that you stored in the environment. Here, you use it to access the editMode value that’s built into the environment to read or write the edit scope.
    @Environment(ModelData.self) var modelData // Read the user’s profile data from the environment to pass control of the data to the profile host.
    @State private var draftProfile = Profile.default //You set the draftProfile here to a default profile as a placeholder until you introduce the model data profile later on.
    
    var body: some View {
        //Text("Profile for: \(draftProfile.username)")
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                        //Add a cancel button to ProfileHost. Unlike the Done button that EditButton provides, the Cancel button doesn’t apply the edits to the real profile data in its closure.
                    }
                }
                Spacer()
                EditButton() //Create an Edit button that toggles the environment’s editMode value on and off. The EditButton controls the same editMode environment value that you accessed in the previous step

            }

            if editMode?.wrappedValue == .inactive { 
                //Add a conditional view that displays either the static profile or the view for Edit mode.

                ProfileSummary(profile: modelData.profile) 
                //To avoid updating the global app state before confirming any edits — such as while the user enters their name — the editing view operates on a copy of itself.
            } else {
                //Text("Profile editor")
                ProfileEditor(profile: $draftProfile)
                //Update the conditional content in ProfileHost to include the profile editor and pass along the profile binding. Now the edit profile view displays when you tap Edit.
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

//The ProfileHost view will host both a static, summary view of profile information and an edit mode.

#Preview {
    ProfileHost()
        .environment(ModelData())
}

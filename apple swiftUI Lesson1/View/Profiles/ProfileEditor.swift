//
//  ProfileEditor.swift
//  apple swiftUI Lesson1
//
//  Created by Oksana Kazarinova on 27/02/2025.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile

    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }

    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                //The first control in the view is a TextField, which controls and updates a string binding — in this case, the user’s chosen display name. You provide a label and a binding to a string when creating a text field.
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }

            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable notifications")
            }

            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }

            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal date")
            }
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}

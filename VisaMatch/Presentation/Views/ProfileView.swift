//
//  ProfileView.swift
//  VisaMatch
//
//  Created by Pichaya Viwatassawin on 10/9/2026.
//

import SwiftUI

struct ProfileView: View {
    let studentProfile: StudentProfile

    var body: some View {
        NavigationStack {
            List {
                LabeledContent("Visa status", value: studentProfile.visaStatus.displayName)
                LabeledContent("Studying", value: studentProfile.coursename)
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView(studentProfile: .mockStudent)
}

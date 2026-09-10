//
//  AppRootView.swift
//  VisaMatch
//
//  Created by Pichaya Viwatassawin on 10/9/2026.
//

import SwiftUI

struct AppRootView: View {
    @State private var studentProfile: StudentProfile?

    var body: some View {
        if let studentProfile {
            RootTabView(studentProfile: studentProfile)
        } else {
            OnboardingView { profile in
                studentProfile = profile
            }
        }
    }
}

#Preview {
    AppRootView()
}

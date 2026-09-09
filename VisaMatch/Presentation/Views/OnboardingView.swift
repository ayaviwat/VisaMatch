//
//  OnboardingView.swift
//  VisaMatch
//
//  Created by Pichaya Viwatassawin on 9/9/2026.
//

import SwiftUI

struct OnboardingView: View {
    @State private var visaStatus: VisaStatus = .studentVisa500
    @State private var courseName: String = ""

    var onContinue: (StudentProfile) -> Void = { _ in }

    var body: some View {
        VStack(spacing: 28) {
            Spacer().frame(height: 32)

            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.primary, lineWidth: 2)
                .frame(width: 72, height: 72)
                .overlay(
                    Text("VM")
                        .font(.title2.bold())
                )

            VStack(spacing: 8) {
                Text("Set Up Visa Profile")
                    .font(.title2.bold())

                Text("Match with employers who sponsor your specific visa subclass.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 32)

            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("What's your visa status?")
                        .font(.subheadline.weight(.semibold))

                    Picker("Visa status", selection: $visaStatus) {
                        ForEach(VisaStatus.allCases, id: \.self) { status in
                            Text(status.displayName).tag(status)
                        }
                    }
                    .tint(.black)
                    .pickerStyle(.menu)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.separator), lineWidth: 1)
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("What are you studying?")
                        .font(.subheadline.weight(.semibold))

                    TextField("e.g. Information Technology", text: $courseName)
                        .padding(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.separator), lineWidth: 1)
                        )
                }
            }
            .padding(.horizontal, 24)

            Spacer()

            Button {
                onContinue(StudentProfile(visaStatus: visaStatus, coursename: courseName))
            } label: {
                Text("Continue")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
    }
}

#Preview {
    OnboardingView()
}

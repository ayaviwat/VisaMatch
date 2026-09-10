//
//  ListingDetailView.swift
//  VisaMatch
//
//  Created by Pichaya Viwatassawin on 9/9/2026.
//

import SwiftUI

struct ListingDetailView: View {
    let listing: InternshipListing
    let student: StudentProfile

    @Binding var savedListings: [InternshipListing]
    private let determineEligibility = DetermineEligibilityUseCase()
    private let saveListing = SaveListingUseCase()

    private var isSaved: Bool {
        savedListings.contains { $0.id == listing.id }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(listing.roleTitle)
                        .font(.title.bold())
                    Text(listing.company)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }

                eligibilityBanner

                VStack(alignment: .leading, spacing: 8) {
                    Text("Role Description")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.secondary)
                        .textCase(.uppercase)
                    Text(listing.description)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Source")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.secondary)
                        .textCase(.uppercase)
                    Text("Posted via \(listing.source.displayName)")
                }
            }
            .padding()
        }
        .safeAreaInset(edge: .bottom) {
            Button {
                // Applying will hand off to the source platform in a future iteration.
            } label: {
                Text("Apply")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
            .background(.bar)
        }
        .navigationTitle("Internship Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    toggleSaved()
                } label: {
                    Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                }
            }
        }
    }

    @ViewBuilder
    private var eligibilityBanner: some View {
        switch Result(catching: { try determineEligibility.execute(listing: listing, for: student) }) {
        case .success(let status):
            bannerLabel(
                icon: status == .eligible ? "checkmark" : "xmark",
                text: status == .eligible
                    ? "This employer sponsors visa applications for this role."
                    : "This employer does not sponsor visa applicants for this role."
            )
        case .failure(let error):
            bannerLabel(
                icon: "exclamationmark.triangle",
                text: error.localizedDescription
            )
        }
    }

    private func bannerLabel(icon: String, text: String) -> some View {
        HStack(alignment: .center, spacing: 8) {
            Image(systemName: icon)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.secondary)
            Text(text)
                .font(.subheadline)
        }
        .padding(.vertical, 10)
        .overlay(alignment: .top) { Divider() }
        .overlay(alignment: .bottom) { Divider() }
    }

    private func toggleSaved() {
        if isSaved {
            savedListings.removeAll { $0.id == listing.id }
        } else {
            try? saveListing.execute(listing: listing, into: &savedListings)
        }
    }
}

#Preview {
    NavigationStack {
        ListingDetailView(listing: InternshipListing.mockSeekListings[0], student: .mockStudent, savedListings: .constant([]))
    }
}

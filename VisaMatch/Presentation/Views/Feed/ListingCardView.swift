//
//  ListingCardView.swift
//  VisaMatch
//

import SwiftUI

struct ListingCardView: View {
    let listing: InternshipListing

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(listing.roleTitle)
                    .font(.headline)
                    .foregroundStyle(.primary)

                Text(listing.company)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text(listing.eligibility.badgeLabel)
                    .font(.caption.weight(.semibold))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .foregroundStyle(listing.eligibility.badgeColor)
                    .overlay(
                        Capsule()
                            .stroke(listing.eligibility.badgeColor, lineWidth: 1)
                    )
            }

            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.separator), lineWidth: 1)
        )
    }
}

#Preview {
    VStack(spacing: 12) {
        ListingCardView(listing: InternshipListing.mockSeekListings[0])
        ListingCardView(listing: InternshipListing.mockLinkedInListings[0])
        ListingCardView(listing: InternshipListing.mockSeekListings[1])
    }
    .padding()
}

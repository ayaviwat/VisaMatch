//
//  BookmarksView.swift
//  VisaMatch
//
//  Created by Pichaya Viwatassawin on 10/9/2026.
//

import SwiftUI

struct BookmarksView: View {
    @Binding var savedListings: [InternshipListing]
    let studentProfile: StudentProfile

    var body: some View {
        NavigationStack {
            Group {
                if savedListings.isEmpty {
                    ContentUnavailableView(
                        "No saved internships yet",
                        systemImage: "bookmark",
                        description: Text("Listings you save will show up here.")
                    )
                } else {
                    List(savedListings) { listing in
                        NavigationLink {
                            ListingDetailView(listing: listing, student: studentProfile, savedListings: $savedListings)
                        } label: {
                            ListingCardView(listing: listing)
                        }
                        .buttonStyle(.plain)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Bookmarks")
        }
    }
}

#Preview {
    BookmarksView(savedListings: .constant([InternshipListing.mockSeekListings[0]]), studentProfile: .mockStudent)
}

//
//  MainFeedView.swift
//  VisaMatch
//

import SwiftUI

struct MainFeedView: View {
    @State private var searchText = ""

    private let aggregateListings = AggregateListingsUseCase()

    var body: some View {
        NavigationStack {
            Group {
                switch loadListings() {
                case .success(let listings):
                    let visibleListings = filtered(listings)
                    if visibleListings.isEmpty {
                        ContentUnavailableView.search(text: searchText)
                    } else {
                        List(visibleListings) { listing in
                            ListingCardView(listing: listing)
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                        }
                        .listStyle(.plain)
                    }
                case .failure(let error):
                    ContentUnavailableView(
                        "Can't load internships",
                        systemImage: "wifi.slash",
                        description: Text(error.localizedDescription)
                    )
                }
            }
            .searchable(text: $searchText, prompt: "Search internships...")
            .navigationTitle("VisaMatch")
        }
    }

    private func loadListings() -> Result<[InternshipListing], AggregationError> {
        Result {
            try aggregateListings.execute(from: InternshipListing.allMockSources)
        }
        .mapError { $0 as! AggregationError }
    }

    private func filtered(_ listings: [InternshipListing]) -> [InternshipListing] {
        guard !searchText.isEmpty else { return listings }
        return listings.filter {
            $0.roleTitle.localizedCaseInsensitiveContains(searchText) ||
            $0.company.localizedCaseInsensitiveContains(searchText)
        }
    }
}

#Preview {
    MainFeedView()
}

//
//  MainFeedView.swift
//  VisaMatch
//

import SwiftUI

struct MainFeedView: View {
    let studentProfile: StudentProfile

    @Binding var savedListings: [InternshipListing]
    @State private var searchText = ""
    @State private var showEligibleOnly = false
    @State private var isShowingFilters = false

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
                            NavigationLink {
                                ListingDetailView(listing: listing, student: studentProfile, savedListings:$savedListings)
                            } label: {
                                ListingCardView(listing: listing)
                            }
                            .buttonStyle(.plain)
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
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingFilters = true
                    } label: {
                        Image(systemName: showEligibleOnly ? "line.3.horizontal.decrease.circle.fill" : "line.3.horizontal.decrease.circle")
                    }
                }
            }
            .sheet(isPresented: $isShowingFilters) {
                FiltersView(showEligibleOnly:$showEligibleOnly)
            }
        }
    }

    private func loadListings() -> Result<[InternshipListing], AggregationError> {
        Result {
            try aggregateListings.execute(from: InternshipListing.allMockSources)
        }
        .mapError { $0 as! AggregationError }
    }

    private func filtered(_ listings: [InternshipListing]) -> [InternshipListing] {
        listings.filter { listing in
            let matchesSearch = searchText.isEmpty
                || listing.roleTitle.localizedCaseInsensitiveContains(searchText)
                || listing.company.localizedCaseInsensitiveContains(searchText)
            let matchesFilter = !showEligibleOnly || listing.eligibility == .eligible
            return matchesSearch && matchesFilter
        }
    }
}

#Preview {
    MainFeedView(studentProfile: .mockStudent, savedListings: .constant([]))
}

//
//  RootTabView.swift
//  VisaMatch
//

import SwiftUI

struct RootTabView: View {
    let studentProfile: StudentProfile
    @State private var savedListings: [InternshipListing] = []
    var body: some View {
        TabView {
            MainFeedView(studentProfile: studentProfile, savedListings: $savedListings)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            ProfileView(studentProfile: studentProfile)
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
            
            
            BookmarksView(savedListings: $savedListings, studentProfile: studentProfile)
                .tabItem {
                    Label("Bookmarks", systemImage: "bookmark")
                }
        }
    }
}

#Preview {
    RootTabView(studentProfile: .mockStudent)
}

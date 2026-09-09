//
//  RootTabView.swift
//  VisaMatch
//

import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            MainFeedView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            NavigationStack {
                ContentUnavailableView(
                    "Profile",
                    systemImage: "person.crop.circle",
                    description: Text("Visa status and course details go here.")
                )
                .navigationTitle("Profile")
            }
            .tabItem {
                Label("Profile", systemImage: "person.crop.circle")
            }
            
            
            NavigationStack {
                ContentUnavailableView(
                    "No saved internships yet",
                    systemImage: "bookmark",
                    description: Text("Listings you save will show up here.")
                )
                .navigationTitle("Bookmarks")
            }
            .tabItem {
                Label("Bookmarks", systemImage: "bookmark")
            }
        }
    }
}

#Preview {
    RootTabView()
}

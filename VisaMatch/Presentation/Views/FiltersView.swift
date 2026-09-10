//
//  FiltersView.swift
//  VisaMatch
//
//  Created by Pichaya Viwatassawin on 10/9/2026.
//
//
//  FiltersView.swift
//  VisaMatch
//

import SwiftUI

struct FiltersView: View {
    @Binding var showEligibleOnly: Bool
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            List {
                Toggle("Show eligible internships only", isOn: $showEligibleOnly).tint(.gray)
            }
            .listStyle(.plain)
            .navigationTitle("Filters")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    FiltersView(showEligibleOnly: .constant(true))
}

//
//  DebugAggregationView.swift
//  VisaMatch
//
//  Created by Pichaya Viwatassawin on 5/9/2026.
//


import SwiftUI
 
struct DebugAggregationView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text("Aggregation Debug")
                    .font(.title2)
                    .bold()
 
                Text(resultText)
                    .font(.system(.body, design: .monospaced))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
        }
    }
 
    private var resultText: String {
        let useCase = AggregateListingsUseCase()
        do {
            let result = try useCase.execute(from: InternshipListing.allMockSources)
            var output = "\(result.count) listings after de-duplication:\n\n"
            for listing in result {
                output += "• \(listing.roleTitle) @ \(listing.company) (\(listing.source.rawValue))\n"
            }
            return output
        } catch {
            return "Error: \(error.localizedDescription)"
        }
    }
}
 
#Preview {
    DebugAggregationView()
}

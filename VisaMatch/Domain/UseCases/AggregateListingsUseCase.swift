//
//  AggregateListingsUseCase.swift
//  VisaMatch
//
//  Created by Pichaya Viwatassawin on 4/9/2026.
//

import Foundation

// when the search ends up with nothing it gives an error message
enum AggregationError: LocalizedError {
    case noSourcesAvailable

    var errorDescription: String? {
        switch self {
        case .noSourcesAvailable:
            return "No internship sources are currently available. Please check your connection and try again."
        }
    }
}

struct AggregateListingsUseCase {
    func execute(from sources: [[InternshipListing]]) throws -> [InternshipListing] {
        let allListings = sources.flatMap { $0 }
        guard !allListings.isEmpty else {
            throw AggregationError.noSourcesAvailable
        }

        var seen = Set<String>()
        var result: [InternshipListing] = []
        for listing in allListings {
            let key = "\(listing.company.lowercased())_\(listing.roleTitle.lowercased())"
            if !seen.contains(key) {
                seen.insert(key)
                result.append(listing)
            }
        }
        return result
    }
}

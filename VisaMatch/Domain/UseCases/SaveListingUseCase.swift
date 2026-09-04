//
//  SaveListingUseCase.swift
//  VisaMatch
//
//  Created by Pichaya Viwatassawin on 4/9/2026.
//

import Foundation

enum SaveListingError: LocalizedError {
    case alreadySaved(roleTitle: String)
 
    //if saving duplicates
    var errorDescription: String? {
        switch self {
        case .alreadySaved(let roleTitle):
            return "\(roleTitle) is already in your saved internships."
        }
    }
}
 
struct SaveListingUseCase {
    func execute(listing: InternshipListing, into savedListings: inout [InternshipListing]) throws {
        if savedListings.contains(where: { $0.id == listing.id }) {
            throw SaveListingError.alreadySaved(roleTitle: listing.roleTitle)
        }
        savedListings.append(listing)
    }
}
 

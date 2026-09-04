//
//  InternshipListing.swift
//  VisaMatch
//
//  Created by Pichaya Viwatassawin on 4/9/2026.
//

import Foundation

struct InternshipListing: Identifiable, Codable {
    let id: UUID
    let roleTitle: String
    let company: String
    let source: ListingSource
    let eligibility: EligibilityStatus
    let description: String
    let postedAt: Date
}

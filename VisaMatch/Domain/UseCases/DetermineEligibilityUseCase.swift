//
//  DetermineEligibilityUseCase.swift
//  VisaMatch
//
//  Created by Pichaya Viwatassawin on 4/9/2026.
//

import Foundation

enum EligibilityError: LocalizedError {
    case missingVisaInformation(roleTitle: String)
 
    var errorDescription: String? {
        switch self {
        case .missingVisaInformation(let roleTitle):
            return "\(roleTitle) doesn't state visa sponsorship information. Marked as unclear — check the listing directly before applying."
        }
    }
}

// MVP limitation: eligibility is read from the listing's pre-set value rather than
// matched against the student's visa conditions, since there's no real scraped
// sponsorship data yet. Listings marked "unclear" surface as a typed error so the
// UI can prompt the student to check manually rather than silently showing "unclear".
struct DetermineEligibilityUseCase {
    func execute(listing: InternshipListing, for student: StudentProfile) throws -> EligibilityStatus {
        if listing.eligibility == .unclear {
            throw EligibilityError.missingVisaInformation(roleTitle: listing.roleTitle)
        }
        return listing.eligibility
    }
}

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

//wont work yet for mvp
struct DetermineEligibilityUseCase {
    func execute(listing: InternshipListing, for student: StudentProfile) -> EligibilityStatus {
        return listing.eligibility
    }
}
 
 

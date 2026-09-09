//
//  EligibilityStatus+Display.swift
//  VisaMatch
//

import SwiftUI

extension EligibilityStatus {
    var badgeLabel: String {
        switch self {
        case .eligible: return "Eligible"
        case .unclear: return "Unclear"
        case .notEligible: return "No Sponsor"
        }
    }

    var badgeColor: Color {
        switch self {
        case .eligible: return .green
        case .unclear: return .orange
        case .notEligible: return .red
        }
    }
}

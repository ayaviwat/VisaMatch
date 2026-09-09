//
//  ListingSource+Display.swift
//  VisaMatch
//
//  Created by Pichaya Viwatassawin on 9/9/2026.
//

import Foundation

extension ListingSource {
    var displayName: String {
        switch self {
        case .seek: return "Seek"
        case .linkedin: return "LinkedIn"
        case .prosple: return "Prosple"
        case .companyCareerPage: return "Company Career Page"
        }
    }
}

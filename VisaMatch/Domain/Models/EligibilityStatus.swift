//
//  EligibilityStatus.swift
//  VisaMatch
//
//  Created by Pichaya Viwatassawin on 4/9/2026.
//

import Foundation

//is the listing elible for students or not based on visa status
enum EligibilityStatus: String, Codable {
    case eligible
    case unclear
    case notEligible
}

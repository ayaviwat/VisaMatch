//
//  VisaStatus+Display.swift
//  VisaMatch
//
//  Created by Pichaya Viwatassawin on 9/9/2026.
//

import Foundation

extension VisaStatus {
    var displayName: String {
        switch self {
        case .studentVisa500: return "Student Visa (Subclass 500)"
        case .temporaryGraduate485: return "Temporary Graduate Visa (Subclass 485)"
        case .other: return "Other visa"
        }
    }
}

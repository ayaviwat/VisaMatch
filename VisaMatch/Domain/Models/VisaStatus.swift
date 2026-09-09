//
//  VisaStatus.swift
//  VisaMatch
//
//  Created by Pichaya Viwatassawin on 4/9/2026.
//

import Foundation

//types of visa a student would have
enum VisaStatus: String, Codable, CaseIterable {
    case studentVisa500
    case temporaryGraduate485
    case other
}

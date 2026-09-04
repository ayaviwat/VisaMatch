//
//  MockData.swift
//  VisaMatch
//
//  Created by Pichaya Viwatassawin on 5/9/2026.
//
 
import Foundation
 
extension InternshipListing {
    static let mockSeekListings: [InternshipListing] = [
        InternshipListing(
            id: UUID(),
            roleTitle: "Software Engineering Intern",
            company: "Canva",
            source: .seek,
            eligibility: .eligible,
            description: "Join our Platform team for a 12-week paid internship building tools used by millions of creators worldwide.",
            postedAt: Date()
        ),
        InternshipListing(
            id: UUID(),
            roleTitle: "Marketing Intern",
            company: "Woolworths",
            source: .seek,
            eligibility: .notEligible,
            description: "Support our marketing team with campaign research and content creation.",
            postedAt: Date()
        )
    ]
 
    static let mockLinkedInListings: [InternshipListing] = [
        InternshipListing(
            id: UUID(),
            roleTitle: "Data Analyst Intern",
            company: "Commonwealth Bank",
            source: .linkedin,
            eligibility: .unclear,
            description: "Work with our analytics team on real banking data projects.",
            postedAt: Date()
        ),
        InternshipListing(
            id: UUID(),
            roleTitle: "UX Design Intern",
            company: "Telstra",
            source: .linkedin,
            eligibility: .eligible,
            description: "Design user experiences for Telstra's customer-facing apps.",
            postedAt: Date()
        )
    ]
 
    static let mockProspleListings: [InternshipListing] = [
        InternshipListing(
            id: UUID(),
            roleTitle: "Frontend Developer Intern",
            company: "Atlassian",
            source: .prosple,
            eligibility: .eligible,
            description: "Build interfaces used by teams around the world at Atlassian.",
            postedAt: Date()
        ),
        // Deliberate duplicate to test AggregateListingsUseCase de-duplication
        InternshipListing(
            id: UUID(),
            roleTitle: "Software Engineering Intern",
            company: "Canva",
            source: .prosple,
            eligibility: .eligible,
            description: "Duplicate posting of the Canva internship, sourced from Prosple.",
            postedAt: Date()
        )
    ]
 
    static var allMockSources: [[InternshipListing]] {
        [mockSeekListings, mockLinkedInListings, mockProspleListings]
    }
}
 
extension StudentProfile {
    static let mockStudent = StudentProfile(
        visaStatus: .studentVisa500,
        coursename: "Bachelor of Artificial Intelligence"
    )
}
 

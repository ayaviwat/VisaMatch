//
//  VisaMatchTests.swift
//  VisaMatchTests
//
//  Created by Pichaya Viwatassawin on 11/9/2026.
//

import Testing
@testable import VisaMatch

struct AggregateListingsUseCaseTests {
    
    //combines from multiplesources with result that isnt empty
    @Test func mergesListingsFromMultipleSources() throws {
        let result = try AggregateListingsUseCase().execute(from: InternshipListing.allMockSources)
        #expect(!result.isEmpty)
    }

    //checks if it removes duplicates ie canva on both seek and prosple
    @Test func removesDuplicateListingsFromDifferentSources() throws {
        let result = try AggregateListingsUseCase().execute(from: InternshipListing.allMockSources)
        let canvaListings = result.filter { $0.company == "Canva" && $0.roleTitle == "Software Engineering Intern" }
        #expect(canvaListings.count == 1)
    }

    //throws when there are no listings at all
    @Test func throwsWhenNoSourcesAvailable() {
        do {
            _ = try AggregateListingsUseCase().execute(from: [])
            Issue.record("Expected an error to be thrown")
        } catch {
            #expect(error as? AggregationError == .noSourcesAvailable)
        }
    }
}

struct DetermineEligibilityUseCaseTests {
    private let student = StudentProfile.mockStudent

    //returns eligible when marked as so
    @Test func returnsEligibleForListingMarkedEligible() throws {
        let listing = InternshipListing.mockSeekListings[0]
        let result = try DetermineEligibilityUseCase().execute(listing: listing, for: student)
        #expect(result == .eligible)
    }

    //returns uneligible when marked as so
    @Test func returnsNotEligibleForListingMarkedNotEligible() throws {
        let listing = InternshipListing.mockSeekListings[1]
        let result = try DetermineEligibilityUseCase().execute(listing: listing, for: student)
        #expect(result == .notEligible)
    }

    //unclear status should throw missing visa info
    @Test func throwsMissingVisaInformationForUnclearListing() {
        let listing = InternshipListing.mockLinkedInListings[0]
        do {
            _ = try DetermineEligibilityUseCase().execute(listing: listing, for: student)
            Issue.record("Expected an error to be thrown")
        } catch {
            #expect(error as? EligibilityError == .missingVisaInformation(roleTitle: listing.roleTitle))
        }
    }
}

struct SaveListingUseCaseTests {
    //saving new listing works without ruining current list
    @Test func appendsNewListingToSavedList() throws {
        var saved: [InternshipListing] = [InternshipListing.mockLinkedInListings[0]]
        let newListing = InternshipListing.mockSeekListings[0]

        try SaveListingUseCase().execute(listing: newListing, into: &saved)

        #expect(saved.count == 2)
    }

    //saving twice throws an already saved error
    @Test func throwsAlreadySavedWhenListingIsSavedTwice() {
        let listing = InternshipListing.mockSeekListings[0]
        var saved: [InternshipListing] = [listing]

        do {
            try SaveListingUseCase().execute(listing: listing, into: &saved)
            Issue.record("Expected an error to be thrown")
        } catch {
            #expect(error as? SaveListingError == .alreadySaved(roleTitle: listing.roleTitle))
        }
    }
}

//
//  CatFactViewModelTests.swift
//  RandomCatFactApp
//
//  Created by sujisha on 15/04/25.
//

import XCTest
@testable import RandomCatFactApp

@MainActor
final class CatFactViewModelTests: XCTestCase {

    func testFetchCatDetails_Success() async {
        let viewModel = CatFactViewModel(apiService: MockSuccessCatFactAPIService())
        await viewModel.fetchCatDetails()

        XCTAssertEqual(viewModel.catFact, "Cats are happy.")
    }
    
    func testFetchCatDetails_SuccessDefault() async {
        let viewModel = CatFactViewModel(apiService: MockSuccessDefaultCatFactAPIService())
        await viewModel.fetchCatDetails()

        XCTAssertEqual(viewModel.catFact, CatFactTexts.defaultCatFact)
    }

    func testFetchCatDetails_InvalidURL() async {
        let viewModel = CatFactViewModel(apiService: MockInvalidURLApiService())
        await viewModel.fetchCatDetails()

        XCTAssertTrue(viewModel.catFact.contains(CatFactTexts.invalidURLString))
    }

    func testFetchCatDetails_DecodingError() async {
        let viewModel = CatFactViewModel(apiService: MockDecodeErrorApiService())
        await viewModel.fetchCatDetails()

        XCTAssertTrue(viewModel.catFact.contains(CatFactTexts.decodeFailCatFact))
    }
    
    func testFetchCatImage_Success() async {
        let viewModel = CatFactViewModel(apiService: MockSuccessCatFactAPIService())
        await viewModel.fetchCatImage()

        XCTAssertNotNil(viewModel.catImage)
    }

    func testFetchCatImage_Failure() async {
        let viewModel = CatFactViewModel(apiService: MockInvalidURLApiService())
        await viewModel.fetchCatImage()
        
        XCTAssertNil(viewModel.catImage)
    }
    
}

//
//  MockCatDetailsAPIService.swift
//  RandomCatFactApp
//
//  Created by sujisha on 15/04/25.
//

@testable import RandomCatFactApp
import Foundation
import UIKit

//MARK: Invalid URL
class MockInvalidURLApiService: CatFactApiService
{
    override func fetchCatFactData() async throws -> CatFactResponse {
        throw CatFactError.invalidURL
    }
    
    override func fetchCatImage() async throws -> UIImage {
        throw CatFactError.invalidURL
    }
}

//MARK: Failure Data
class MockDecodeErrorApiService: CatFactApiService {
    struct DummyError: Error {}

    override func fetchCatFactData() async throws -> CatFactResponse {
        throw CatFactError.decodingCatFact(DummyError())
    }

}

//MARK: Success Mock
class MockSuccessCatFactAPIService: CatFactApiService
{
    override func fetchCatFactData() async throws -> CatFactResponse {
        return CatFactResponse(data: ["Cats are happy."])
    }
    
    override func fetchCatImage() async throws -> UIImage {
        return UIImage(systemName: "photo")!  // Return a dummy image
    }
}


//MARK: Success Mock
class MockSuccessDefaultCatFactAPIService: CatFactApiService
{
    override func fetchCatFactData() async throws -> CatFactResponse {
        return CatFactResponse(data: [])
    }
    
    override func fetchCatImage() async throws -> UIImage {
        return UIImage(systemName: "photo")!  // Return a dummy image
    }
}

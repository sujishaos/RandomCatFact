//
//  RandomCatUtils.swift
//  RandomCatFactApp
//
//  Created by sujisha on 15/04/25.
//

import Foundation

enum CatFactAPIs {
    static let catFactDataURL = "https://meowfacts.herokuapp.com/"
    static let catImageURL = "https://cataas.com/cat?timestamp="
}

enum CatFactTexts {
    static let defaultCatFact = "No fact found."
    static let invalidURLString = "The cat fact API URL is invalid."
    static let networkError = "Network error occurred:"
    static let decodeFailCatFact = "Network error occurred:"
    static let decodeFailCatImage = "Network error occurred:"
    static let unknownError    = "Something went wrong. Please try again."
}

enum CatFactError: Error, LocalizedError {
    case invalidURL
    case network(Error)
    case decodingCatFact(Error)
    case decodingCatImage(Error)
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return CatFactTexts.invalidURLString
        case .network(let error):
            return CatFactTexts.networkError + "\(error.localizedDescription)"
        case .decodingCatFact(let error):
            return  CatFactTexts.decodeFailCatFact + "\(error.localizedDescription)"
        case .decodingCatImage(let error):
            return CatFactTexts.decodeFailCatImage + "\(error.localizedDescription)"
        case .unknown:
            return CatFactTexts.unknownError
        }
    }
}


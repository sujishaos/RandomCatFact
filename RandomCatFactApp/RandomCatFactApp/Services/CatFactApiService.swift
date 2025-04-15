//
//  Untitled.swift
//  RandomCatFactApp
//
//  Created by sujisha on 14/04/25.
//

import Foundation
import Combine
import UIKit


class CatFactApiService
{
    private let session: URLSession

    init(session: URLSession = .shared) {
            self.session = session
    }
    
    func fetchCatFactData() async throws -> CatFactResponse {
        guard let url = URL(string: CatFactAPIs.catFactDataURL) else {
            throw CatFactError.invalidURL
        }

        do {
            let (data, _) = try await session.data(from: url)
            let decoded = try JSONDecoder().decode(CatFactResponse.self, from: data)
            return decoded
        } catch let error as DecodingError {
            throw CatFactError.decodingCatFact(error)
        } catch {
            throw CatFactError.network(error)
        }
    }
    
    func fetchCatImage() async throws -> UIImage {
            guard let url = URL(string: CatFactAPIs.catImageURL + UUID().uuidString) else {
                throw CatFactError.invalidURL
            }

            do {
                let (data, _) = try await session.data(from: url)
                guard let image = UIImage(data: data) else {
                    throw CatFactError.decodingCatImage(NSError())
                }
                return image
            } catch {
                throw CatFactError.network(error)
            }
        }
    
}

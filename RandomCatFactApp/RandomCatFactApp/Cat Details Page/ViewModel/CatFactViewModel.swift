//
//  CatFactViewModel.swift
//  RandomCatFactApp
//
//  Created by sujisha on 14/04/25.
//

import Foundation
import Combine
import SwiftUI

@MainActor
class CatFactViewModel: ObservableObject
{
    @Published var catFact: String = "Tap to load a cat fact!"
    @Published var catImage: UIImage? = nil
    

    private var service : CatFactApiService! = nil
    private var cancellables = Set<AnyCancellable>()

     init(apiService : CatFactApiService)
    {
        self.service = apiService
    }
    
    func fetchCatDetails() async
    {
        catImage = nil
        async let catFact: () = fetchCatFact()
        async let catImage: () = fetchCatImage()

        await catFact
        await catImage
    }
    
    func fetchCatFact() async
    {
        do
        {
            let fact = try await service.fetchCatFactData()
            let fullText = fact.data.first ?? CatFactTexts.defaultCatFact
            await animateTextWordByWord(fullText)
        }
        catch
        {
            if let error = error as? CatFactError {
                catFact = "Error: \(error.localizedDescription)"
            } else {
                catFact = CatFactTexts.unknownError + "\(error.localizedDescription)"
            }
        }
    }
    
    func fetchCatImage() async {
            do {
                let image = try await service.fetchCatImage()
                catImage = image
            } catch {
                catImage = nil
                print("Image download error: \(error.localizedDescription)")
            }
    }
}


extension CatFactViewModel
{
     func animateTextWordByWord(_ text: String) async {
        await MainActor.run {
            catFact = ""
        }
        
        let words = text.split(separator: " ").map(String.init)
        for (index, word) in words.enumerated() {
            try? await Task.sleep(nanoseconds: 100_000_000) // 0.3 seconds
            await MainActor.run {
                catFact += (index == 0 ? "" : " ") + word
            }
        }
    }
}

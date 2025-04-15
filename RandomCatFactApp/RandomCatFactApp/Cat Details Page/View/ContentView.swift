//
//  ContentView.swift
//  RandomCatFactApp
//
//  Created by sujisha on 14/04/25.
//

import SwiftUI

struct ContentView: View
{
    @StateObject private var viewModel = CatFactViewModel(apiService: CatFactApiService())
    
    var body: some View
    {
        ZStack {
            
            Color.orange.ignoresSafeArea()
            
            VStack(spacing: 20)
            {
                Spacer().frame(height: 20)
                if let uiImage = viewModel.catImage
                {
                    
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame( height: 250, alignment: .center)
                        .cornerRadius(12)
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.orange.opacity(0.5), lineWidth: 2)
                        )
                    
                }
                else
                {
                    VStack
                    {
                        Text("Your cat snap is on the way..")
                            .foregroundColor(.gray)
                        ProgressView()
                    }
                    .frame(height: 250)
                    .cornerRadius(12)
                }
                
                Text(viewModel.catFact)
                    .font(.headline)
                    .padding()
                    .multilineTextAlignment(.center)
                    .id(viewModel.catFact)
                    .transition(.opacity.combined(with: .scale))
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(LinearGradient(
                gradient: Gradient(colors: [Color(.systemGray6), Color.orange.opacity(0.2)]),
                startPoint: .top,
                endPoint: .bottom
            ))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.orange.opacity(0.5), lineWidth: 2)
            )
            .cornerRadius(16)
            .padding()
            .onTapGesture {
                Task {
                    await viewModel.fetchCatDetails()
                }
            }
            .onAppear {
                Task {
                    await viewModel.fetchCatDetails()
                }
            }
        }
    }
}


#Preview {
    ContentView()
}


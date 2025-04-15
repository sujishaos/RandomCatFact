//
//  CatFactSplashView.swift
//  RandomCatFactApp
//
//  Created by sujisha on 15/04/25.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Image(systemName: "pawprint.fill") // Replace with your cat image if needed
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.orange)
                    .padding()

                Text("Random Cat Facts")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .ignoresSafeArea()
            .onAppear {
                // Delay for splash duration
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}

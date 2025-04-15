# 🐱 Random Cat Fact App

A fun and lightweight SwiftUI app that fetches and displays random cat facts along with cute cat images. 

<p align="center">
  <img src="https://github.com/user-attachments/assets/3c5078ba-8db8-4ac3-a94b-f7081d7f0bc1" alt="App Screenshot" width="400"/>
</p>

---

## 📱 Features

- 🐾 Displays random cat facts
- 🖼️ Loads random cat images
- ✨ Word-by-word animated fact text
- 📶 Asynchronous networking using Swift's `async/await`
- 🧪 Unit-testable architecture

---

## 🚀 Getting Started

### Installation

1. Clone the repo: 

   ```bash
   git clone https://github.com/sujishaos/RandomCatFact
   cd RandomCatFactApp
   
2. Open in Xcode:
  open RandomCatFactApp.xcodeproj

4. Build & run the app on your simulator or device.

## 🧠 Architecture

The app follows a simple MVVM (Model-View-ViewModel) structure.

- CatFactViewModel: Handles data fetching and animation logic.
- CatFactApiService: Makes network calls to get facts and images.
- ContentView: The main UI layer built with SwiftUI.
- SplashView: The splash screen UI built with SwiftUI.
- RandomCatUtils: The static strings and enumarators used. 

## 🧪 Testing

Unit Tested the ViewModel and NeworkAPIs using MockServices.
- MockCatDetailsAPIService :  Mocked Network API responses to verify the viewModel behaviours
- CatFactViewModelTests : Includes unit tests for success , failure , Invalid URL , default Value test cases for the API calls

## 🌐 APIs Used

- Cat Fact API - For random cat facts -  https://meowfacts.herokuapp.com/
- Cataas API — for random cat images - https://cataas.com/cat

  

  

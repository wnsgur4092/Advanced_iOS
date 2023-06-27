//
//  ContentView.swift
//  Week8
//
//  Created by JunHyuk Lim on 27/6/2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @StateObject private var viewModel = ClassificationViewModel(numberOfSamples: 10)
    @State private var animateRecordButton = false
    @State private var loading = false
    
    // MARK: - Body
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Spacer()
                            
                ResultView(
//                    containsCatSound: viewModel.recordContainsCat,
                    results: viewModel.classification
                )
                .frame(width: 300)
                .padding()
            
                Spacer()
                
                ZStack {
                    
                    FrequencyView(
                        samples: viewModel.soundSamples
                    )
                    .frame(
                        width: 250,
                        height: 300,
                        alignment: .center
                    )
                    
                    if loading {
                        
                        LoadingView()
                        
                    }
                    
                } //: ZStack
                
                Spacer()
                
                VStack(spacing: 20) {
                    
                    Button(viewModel.recordingButtonTitle) {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            viewModel.startStopRecording()
                        }
                    }
                    .frame(width: 200)
                    .padding()
                    .foregroundColor(.white)
                    .background(viewModel.recording ? .red : .green)
                    .shadow(color: .red, radius: animateRecordButton ? 10 : 0, x: 0, y: 0)
                    .cornerRadius(5)
                    
                    Button("Classify") {
                        Task {
                            self.loading = true
                            await viewModel.classify()
                            self.loading = false
                        }
                    }
                    .frame(width: 200)
                    .padding()
                    .foregroundColor(.white)
                    .background(.secondary)
                    .cornerRadius(5)
                    
                } //: VStack
                
            } //: VStack
            .navigationTitle("🐈 Meow Meaning!")
            .task {
                await viewModel.requestPermission()
            }
            .padding()
            
        } //: NavigationView
        
    } //: Body
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}

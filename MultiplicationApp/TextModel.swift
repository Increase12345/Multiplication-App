//
//  TextModel.swift
//  MultiplicationApp
//
//  Created by Nick Pavlov on 2/15/23.
//

import Foundation
import SwiftUI


// Main text
struct TextModel: View {
    let text: String
    
    var body: some View {
        Text(text)
            .multilineTextAlignment(.center)
            .padding(20)
            .background(.thinMaterial)
            .cornerRadius(10)
    }
}

// Intro text
struct IntroText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .bold()
            .overlay {
                LinearGradient(gradient: Gradient(colors: [.red, .blue, .green]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .mask(
                        Text(text)
                            .font(.title)
                            .bold()
                    )}
        
    }
}

// TextField modificator
struct UserInput: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .frame(width: 250)
            .textFieldStyle(.roundedBorder)
            .shadow(radius: 10)
            .padding(.top)
    }
}


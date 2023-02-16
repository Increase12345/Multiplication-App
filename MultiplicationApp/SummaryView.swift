//
//  SummaryView.swift
//  MultiplicationApp
//
//  Created by Nick Pavlov on 2/15/23.
//

import SwiftUI

struct SummaryView: View {
    @EnvironmentObject var model: Model
    @State private var jumpingLogo = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackGround()
                VStack {
                    Spacer()
                    
                    // Name of user with suggestions
                    IntroText(text: "HEY \(model.UserName.uppercased())")
                    
                    // Check how good user did answer questions
                    if model.score <= 3 {
                        IntroText(text: "You need improvement")
                    } else if model.score <= 7 {
                        IntroText(text: "Not bad")
                    } else {
                        IntroText(text: "Great Job")
                    }
                    
                    // Performing number of current answers
                    TextModel(text: "You answered \(model.score) of \(model.questionsRemaiden) correct questions")
                    Spacer()
                    
                    // Button to restart the game
                    NavigationLink(destination: {
                        MainView()
                    }, label: {
                        VStack(spacing: 10) {
                            Image("rabbit")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .offset(x: jumpingLogo ? 0: -25)
                                .animation(Animation.interpolatingSpring(stiffness: 5, damping: 0).repeatForever(), value: jumpingLogo)
                            Text("Tap to restart")
                                .foregroundColor(.secondary)
                                .font(.caption)
                        }
                    })
                }
            }
            .navigationBarBackButtonHidden()
            
            // Task to toggle animation of button
            .task {
                withAnimation {
                    jumpingLogo = true
                }
            }
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
            .environmentObject(Model())
    }
}

//
//  ContentView.swift
//  MultiplicationApp
//
//  Created by Nick Pavlov on 2/14/23.
//

import SwiftUI

struct ContentView: View {
    @State private var jumpingLogo = false
    @EnvironmentObject var model: Model
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackGround()
                VStack {
                    Spacer()
                    
                    // Welcome message
                    VStack {
                        IntroText(text: "Enter your name")
                    }
                    
                    // User text input
                    VStack {
                        TextField("", text: $model.UserName)
                            .modifier(UserInput())
                    }
                    Spacer()
                    
                    // Navigation to the next view
                    VStack {
                        NavigationLink(destination: {
                            MainView()
                        }, label: {
                            VStack(spacing: 10) {
                                Image("dog")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .offset(x: jumpingLogo ? 0: -25)
                                    .animation(Animation.interpolatingSpring(stiffness: 5, damping: 0).repeatForever(), value: jumpingLogo)
                                Text("Tap to continue")
                                    .foregroundColor(.secondary)
                                    .font(.caption)
                            }
                        })
                    }
                }
            }
            
            // Task to toggle animation of button
            .task {
                withAnimation {
                    jumpingLogo.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model())
    }
}

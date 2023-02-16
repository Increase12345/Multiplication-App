//
//  GameView.swift
//  MultiplicationApp
//
//  Created by Nick Pavlov on 2/14/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var model: Model
    @State private var alert = false
    @State private var restartAlert = false
    @State private var restartGame = false
    @State private var catchOpacity = false
    @State private var catchCorrectNumber = 0
    @State private var alertNotice = ["WOW 🙃", "Good job 👍", "Excellent 👌", "Great 👏", "Very good 😎"].shuffled()
    
    // All images
    @State private var emojis = ["bear", "buffalo", "chick", "chicken", "dog", "duck", "elephant", "frog", "gorilla", "hippo", "horse", "monkey", "owl", "panda", "parrot", "penguin", "rhino", "sloth", "snake", "zebra", "cow", "crocodile", "giraffe", "goat", "moose", "narwhal", "pig", "rabbit", "walrus", "whale"].shuffled()
    
    var body: some View {
        NavigationStack {
            if restartGame {
                SummaryView()
            } else {
                ZStack {
                    BackGround()
                    VStack {
                        
                        // Asking user multiplying
                        TextModel(text: "How much is: \(model.pickTable) * \(model.randomNumber)")
                            .padding(.top)
                            .font(.title)
                        Spacer()
                        
                        // Performing buttons with sugested numbers
                        ForEach(0..<4, id: \.self) { item in
                            Button(action: {
                                tapButton(number: item)
                            }, label: {
                                HStack(spacing: 20) {
                                    AnswerImage(image: "\(emojis[item])")
                                    Text("\(model.questions[item])")
                                        .font(.largeTitle)
                                        .foregroundColor(.black)
                                }
                                .frame(width: 300, height: 80)
                                .background(.thinMaterial)
                                .opacity(catchOpacity && catchCorrectNumber != item ? 0.25: 1)
                                .clipShape(Capsule())
                            })
                        }
                        Spacer()
                        
                        // Bottom text view with scores and question process
                        Text("Total score \(model.score)")
                        Text("Question \(model.questionCount) of \(model.questionsRemaiden)")
                    }
                }
                .navigationBarBackButtonHidden()
                
                // Alert afret each question
                .alert(model.alertTitle, isPresented: $alert) {
                    Button("Continue", action: continueButton)
                } message: {
                    Text(model.alertMessage)
                }
                
                // Alerts at the end of the game
                .alert("Congratulation!\nYou finished", isPresented: $restartAlert) {
                    Button("Summary", action: { restartGame = true })
                } message: {
                    Text("Press summary to see result")
                }
            }
        }
        .task {
            generateQuestion()
        }
    }
    
    // Method to see if the answer is correct
    func tapButton(number: Int) {
        catchCorrectNumber = number
            if model.correctAnswer == model.questions[number] {
                model.score += 1
                model.alertTitle = "Correct!"
                model.alertMessage = "\(alertNotice[0])"
                catchOpacity = true
                model.catchEndGame += 1
            } else {
                model.alertTitle = "Wrong!"
                model.alertMessage = "Right answer is \(model.correctAnswer) 😕"
                catchOpacity = true
                model.catchEndGame += 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                alert = true
            }
    }
    
    // Method for question alert
    func continueButton() {
        if model.catchEndGame < model.questionsRemaiden + 1 {
            emojis.shuffle()
            model.questions.removeAll()
            model.randomNumber = Int.random(in: 1...10)
            generateQuestion()
            alertNotice.shuffle()
            catchOpacity = false
            model.questionCount += 1
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                restartAlert = true
            }
        }
    }
    
    // Method to generate new numbers
    func generateQuestion() {
        model.questions.removeAll()
        for _ in 0..<3 {
            let random = Int.random(in: 0...100)
            model.questions.append(random)
        }
        model.correctAnswer = model.pickTable * model.randomNumber
        model.questions.append(model.correctAnswer)
        model.questions.shuffle()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(Model())
    }
}

//
//  MainView.swift
//  MultiplicationApp
//
//  Created by Nick Pavlov on 2/14/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var model: Model
    let questions = [5, 10, 20]
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackGround()
                VStack{
                    Spacer()
                    
                    // Choosing multiply number
                        TextModel(text: "Hey \(model.UserName)\npick multiplication table to practice")
                        Picker("", selection: $model.pickTable) {
                            ForEach(0..<11, id: \.self) { table in
                                Text("\(table)")
                            }
                        }
                        .pickerStyle(.segmented)
                    Spacer()
                        .frame(height: 100)
                    
                    
                    // Choosing number of questions
                        TextModel(text: "How many questions you want to be asked?")
                        
                        Picker("", selection: $model.questionsRemaiden) {
                            ForEach(questions, id: \.self) { question in
                                Text("\(question)")
                            }
                        }
                        .pickerStyle(.segmented)
                    Spacer()
                    
                    // Navigation to the next view
                        NavigationLink(destination: {
                            GameView()
                        }, label: {
                            Text("Start")
                                .padding(50)
                                .background(.thinMaterial)
                                .clipShape(Circle())
                        })
                    Spacer()
                }
                .navigationBarBackButtonHidden()
            }
        }
        
        // Task for reseting all values before game started
        .task {
            model.score = 0
            model.questionCount = 1
            model.correctAnswer = 0
            model.randomNumber = Int.random(in: 1...10)
            model.catchEndGame = 1
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Model())
    }
}

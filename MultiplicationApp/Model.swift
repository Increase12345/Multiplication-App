//
//  Model.swift
//  MultiplicationApp
//
//  Created by Nick Pavlov on 2/14/23.
//

import Foundation

class Model: ObservableObject {
    @Published var UserName = ""
    @Published var pickTable = 5
    @Published var score = 0
    @Published var questionCount = 1
    @Published var questionsRemaiden = 10
    @Published var correctAnswer = 0
    @Published var questions = [1, 2, 3, 4]
    @Published var randomNumber = Int.random(in: 1...10)
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    @Published var catchEndGame = 1
}

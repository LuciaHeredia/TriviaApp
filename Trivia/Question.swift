//
//  Question.swift
//  Trivia
//
//  Created by lucia heredia on 21/05/2022.
//

import Foundation

class Question {
    let questionImage: String
    let optionA: String
    let optionB: String
    let optionC: String
    let optionD: String
    let correctAnswer: Int
    
    init(image:String, choiceA:String, choiceB:String, choiceC:String, choiceD:String, answer:Int) {
        questionImage = image
        optionA = choiceA
        optionB = choiceB
        optionC = choiceC
        optionD = choiceD
        correctAnswer = answer
    }
    
}

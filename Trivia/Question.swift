//
//  Question.swift
//  Trivia
//
//  Created by lucia heredia on 21/05/2022.
//

import Foundation

struct Question : Codable {
    let questionImage: String
    let optionA: String
    let optionB: String
    let optionC: String
    let optionD: String
    let correctAnswer: Int
}

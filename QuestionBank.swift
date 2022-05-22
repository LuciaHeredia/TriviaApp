//
//  QuestionBank.swift
//  Trivia
//
//  Created by lucia heredia on 21/05/2022.
//

import Foundation

class QuestionBank {
    var list = [Question]()
    
    init(){
        list.append(Question(image: "1-in", choiceA: "Scotland", choiceB: "Italy", choiceC: "Ireland", choiceD: "India", answer: 4))
        
        list.append(Question(image: "2-jp", choiceA: "Ecuador", choiceB: "Japan", choiceC: "Georgia", choiceD: "Mexico", answer: 2))
        
        list.append(Question(image: "3-it", choiceA: "Italy", choiceB: "Israel", choiceC: "Honduras", choiceD: "Turkey", answer: 1))
        
    }
    
    
}

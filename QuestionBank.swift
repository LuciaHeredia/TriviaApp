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
        
        list.append(Question(image: "1-in", choiceA: "Scotland", choiceB: "Senegal", choiceC: "Ireland", choiceD: "India", answer: 4))
        
        list.append(Question(image: "2-jp", choiceA: "Ecuador", choiceB: "Japan", choiceC: "Georgia", choiceD: "Mexico", answer: 2))
        
        list.append(Question(image: "3-it", choiceA: "Italy", choiceB: "Uzbekistan", choiceC: "Honduras", choiceD: "Turkey", answer: 1))

        list.append(Question(image: "4-hn", choiceA: "Argentina", choiceB: "Honduras", choiceC: "Nicaragua", choiceD: "Netherlands", answer: 2))
        
        list.append(Question(image: "5-jm", choiceA: "Namibia", choiceB: "Lithuania", choiceC: "Jamaica", choiceD: "Algeria", answer: 3))
        
        list.append(Question(image: "6-ke", choiceA: "Kenya", choiceB: "Tanzania", choiceC: "Portugal", choiceD: "Sudan", answer: 1))
        
        list.append(Question(image: "7-az", choiceA: "Philippine", choiceB: "Andorra", choiceC: "Romania", choiceD: "Azarbaijan", answer: 4))
        
        list.append(Question(image: "8-ie", choiceA: "Ethiopia", choiceB: "Irland", choiceC: "Bolivia", choiceD: "Hungary", answer: 2))
        
        list.append(Question(image: "9-ge", choiceA: "Georgia", choiceB: "Taiwan", choiceC: "Morocco", choiceD: "Canada", answer: 1))
        
        list.append(Question(image: "10-fr", choiceA: "Nicaragua", choiceB: "New Zealand", choiceC: "France", choiceD: "Australia", answer: 3))
        
        list.append(Question(image: "11-fi", choiceA: "Austria", choiceB: "Finland", choiceC: "Paraguay", choiceD: "Peru", answer: 2))
        
        list.append(Question(image: "12-es", choiceA: "Ecuador", choiceB: "Romania", choiceC: "Columbia", choiceD: "Spain", answer: 4))
        
        list.append(Question(image: "13-dk", choiceA: "Denmark", choiceB: "Portugal", choiceC: "Switzerland", choiceD: "Austria", answer: 1))
        
        list.append(Question(image: "14-ar", choiceA: "Nicaragua", choiceB: "Argentina", choiceC: "Argentina", choiceD: "Philippine", answer: 2))
        
        list.append(Question(image: "15-cl", choiceA: "Chile", choiceB: "Kazakhstan", choiceC: "Russia", choiceD: "Uzbekistan", answer: 1))
    
    }
    
    
}

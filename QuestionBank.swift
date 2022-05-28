//
//  QuestionBank.swift
//  Trivia
//
//  Created by lucia heredia on 21/05/2022.
//

import Foundation

public class QuestionBank {
    @Published var list = [Question]()
    
    init() {
        load()
        shuffleList()
    }
    
    func load() {
        if let fileLocation = Bundle.main.url(forResource: "flags", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Question].self, from: data)
                self.list = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    func shuffleList() {
        self.list.shuffle()
    }
        
}

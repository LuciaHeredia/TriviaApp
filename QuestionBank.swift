//
//  QuestionBank.swift
//  Trivia
//
//  Created by lucia heredia on 21/05/2022.
//

import Foundation
import FirebaseStorage


public class QuestionBank {
    @Published var list = [Question]()
    
    init() {
        self.list = QuestionBank.get()
        shuffleList()
    }
    
    func shuffleList() {
        self.list.shuffle()
    }
        
}

extension QuestionBank {
    
    static func get() -> [Question] {
        
        // definitions:
        let oneMB : Int64 = 1024 * 1024
        
        var jsonReference: StorageReference {
            return Storage.storage().reference().child("json")
        }
        let jsonFile : String = "flags.json"
        let fileRef = jsonReference.child(jsonFile)
        
        var tLis = [Question]()
            
        let group = DispatchGroup.init()
        
        
        group.enter()
        // get json file from firebase storage
        fileRef.getData(maxSize: oneMB) { data, error in
            do {
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Question].self, from: data!)
                tLis = dataFromJson
                group.leave()
            } catch {
                print("Failed downloading json file!")
                print(error)
            }
        }
        group.wait()
        
        
        return tLis
    }
    
}

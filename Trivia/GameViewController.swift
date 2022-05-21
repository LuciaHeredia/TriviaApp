//
//  GameViewController.swift
//  Trivia
//
//  Created by lucia heredia on 21/05/2022.
//

import UIKit

class GameViewController: UIViewController {

    
    @IBOutlet weak var livesTextField: UITextField!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    
    // outlet for buttons
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    
    var currentScore: Int = 0, previousScore: Int = 0
    var gameNumber: Int = 0, totalGames: Int = 3 // 15
    
    var questionBank = [Question]()
    
    let flagNames = ["1-in","2-jp","3-it","4-hn","5-jm",
                     "6-ke","7-az","8-ie","9-ge","10-fr",
                     "11-fi","12-es","13-dk","14-ar","15-cl"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        updateQuestion()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            print("option A")
        case 2:
            print("option B")
        case 3:
            print("option C")
        case 4:
            print("option D")
        default:
            print("")
        }
    }
    

    func updateQuestion(){
        //optionA.setTitle(questionBank[0].optionA, for: .normal)
    }

    

}

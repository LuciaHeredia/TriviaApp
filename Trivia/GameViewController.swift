//
//  GameViewController.swift
//  Trivia
//
//  Created by lucia heredia on 21/05/2022.
//

import UIKit

class GameViewController: UIViewController {

    
    @IBOutlet weak var livesLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var currentScoreLabel: UILabel!
    
    // outlet for buttons
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    var currentScore: Int = 0, previousScore: Int = 0
    var gameNumber: Int = 0, totalGames: Int = 3 // 15
    var selectedAnswear: Int = 0
    
    var allQuestions = QuestionBank()
    
    let flagNames = ["1-in","2-jp","3-it","4-hn","5-jm",
                     "6-ke","7-az","8-ie","9-ge","10-fr",
                     "11-fi","12-es","13-dk","14-ar","15-cl"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == selectedAnswear {
            print("correct")
            currentScore += 1
            currentScoreLabel.text = currentScore.description
            gameNumber += 1
            questionLabel.text = gameNumber.description + "/15"
            // update BAR
            //updateQuestion
        } else {
            if totalGames>0 {
                // number of lives decreases
                totalGames -= 1
                livesLabel.text = "x " + totalGames.description
            } else {
                //popup game over
                //go back to main screen
            }
        }
    }
    

    func updateQuestion() {
        flagImageView.image = UIImage(named: (allQuestions.list[gameNumber].questionImage))
        optionA.setTitle(allQuestions.list[gameNumber].optionA, for: UIControl.State.normal)
        optionB.setTitle(allQuestions.list[gameNumber].optionB, for: UIControl.State.normal)
        optionC.setTitle(allQuestions.list[gameNumber].optionC, for: UIControl.State.normal)
        optionD.setTitle(allQuestions.list[gameNumber].optionD, for: UIControl.State.normal)
        selectedAnswear = allQuestions.list[gameNumber].correctAnswer
    }

    func updateUI(){
        //optionA.setTitle(questionBank[0].optionA, for: .normal)
    }
    
    

}

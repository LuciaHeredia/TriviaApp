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
    var gameNumber: Int = 0, totalGames: Int = 2 // 15
    var livesNumber: Int = 3
    var selectedAnswear: Int = 0
    
    var allQuestions = QuestionBank()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == selectedAnswear {
            print("correct")
            if gameNumber <  totalGames {
                currentScore += 1
                currentScoreLabel.text = currentScore.description
                gameNumber += 1
                questionLabel.text = gameNumber.description + "/15"
                // update BAR
                updateQuestion()
            } else {
                //popup game over
                // if score is high, put to home
                backToHome()
            }
        } else {
            if livesNumber>0 {
                // number of lives decreases
                livesNumber -= 1
                livesLabel.text = "x " + livesNumber.description
            } else {
                //popup game over
                // if score is high, put to home
                backToHome()
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
    
    func backToHome() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "home") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}

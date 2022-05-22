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
        // update
        questionLabel.text = (gameNumber+1).description + "/" + (totalGames+1).description
        progressView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(gameNumber + 1)
        // start questions
        updateQuestion()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == selectedAnswear {
            if gameNumber <  totalGames {
                // score increases
                currentScore += 1
                currentScoreLabel.text = currentScore.description
                // number of game increases
                gameNumber += 1
                questionLabel.text = (gameNumber+1).description + "/" + (totalGames+1).description
                // progress bar
                progressView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(gameNumber + 1)
                // TODO: update BAR
                // next question
                updateQuestion()
            } else {
                if currentScore > previousScore {
                    // TODO: if score is high, put to home
                    showAlert(titleMsg: "Congratulations", msg: "You beat the top score!")
                } else {
                    showAlert(titleMsg: "Game Over", msg: "You didn't beat the top score!")
                }
            }
        } else {
            if livesNumber>1 {
                // number of lives decreases
                livesNumber -= 1
                livesLabel.text = "x " + livesNumber.description
            } else {
                // number of lives decreases
                livesNumber -= 1
                livesLabel.text = "x " + livesNumber.description
                showAlert(titleMsg: "Game Over", msg: "You Lost!")
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
    
    func showAlert(titleMsg: String, msg: String) {
        // Create a new alert
        let dialogMessage = UIAlertController(title: titleMsg, message: msg, preferredStyle: .alert)
        
        // Create button with action handler
         let backHome = UIAlertAction(title: "Back Home", style: .default, handler: { (action) -> Void in
             print("Back To Home button tapped")
             self.backToHome()
          })
         
        //Add button to a dialog message
        dialogMessage.addAction(backHome)
        
        // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    func backToHome() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "home") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

    
}

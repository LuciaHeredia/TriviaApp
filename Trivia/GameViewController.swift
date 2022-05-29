//
//  GameViewController.swift
//  Trivia
//
//  Created by lucia heredia on 21/05/2022.
//

import UIKit
import FirebaseStorage

class GameViewController: UIViewController {
        
    @IBOutlet weak var livesLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var currentScoreLabel: UILabel!
    
    // outlet for buttons
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
        
    var imageReference: StorageReference {
        return Storage.storage().reference().child("images")
    }
    let imageEnding = ".png"
    
    var allQuestions = QuestionBank().list
    
    var currentScore: Int = 0, previousScore: Int = 0
    var gameNumber: Int = 0, totalGames: Int = 0
    var livesNumber: Int = 3
    var selectedAnswear: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // loading spinner
        spinner.startAnimating()
        // update
        totalGames = allQuestions.count - 1
        questionLabel.text = (gameNumber+1).description + "/" + (totalGames+1).description
        progressView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.count)) * CGFloat(gameNumber + 1)
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
                progressView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.count)) * CGFloat(gameNumber + 1)
                // TODO: update BAR
                // next question
                updateQuestion()
            } else {
                // score increases
                currentScore += 1
                currentScoreLabel.text = currentScore.description
                
                if currentScore > previousScore {
                    previousScore = currentScore
                    saveTopScore()
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
                
                if currentScore > previousScore {
                    previousScore = currentScore
                    saveTopScore()
                    showAlert(titleMsg: "Congratulations", msg: "You beat the top score!")
                } else {
                    showAlert(titleMsg: "Game Over", msg: "You didn't beat the top score!")
                }
            }
        }
    }

    func updateQuestion() {
        loadImageFromFirebase()
        loadButtonsAnswers()
    }
    
    func loadImageFromFirebase() {
        let imageName = allQuestions[gameNumber].questionImage + imageEnding
        let downloadImageRef = imageReference.child(imageName)
        
        let downloadTask = downloadImageRef.getData(maxSize: 1024 * 1024 * 12) { data, error in
            if let data = data {
                let image = UIImage(data: data)
                self.spinner.stopAnimating() // stop loading spinner
                self.spinner.isHidden = true // hiding spinner
                self.flagImageView.image = image
                print("Image downloaded!")
            }
            print("Failed downloading image!")
        }
        
        downloadTask.resume()
    }
    
    func loadButtonsAnswers() {
        optionA.setTitle(allQuestions[gameNumber].optionA, for: UIControl.State.normal)
        optionB.setTitle(allQuestions[gameNumber].optionB, for: UIControl.State.normal)
        optionC.setTitle(allQuestions[gameNumber].optionC, for: UIControl.State.normal)
        optionD.setTitle(allQuestions[gameNumber].optionD, for: UIControl.State.normal)
        selectedAnswear = allQuestions[gameNumber].correctAnswer
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
    
    func saveTopScore() {
        NotificationCenter.default.post(name: Notification.Name("topScore"), object: previousScore.description)
    }
    
    func backToHome() {
        dismiss(animated: true, completion: nil)
    }

    
}


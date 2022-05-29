//
//  ViewController.swift
//  Trivia
//
//  Created by lucia heredia on 21/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreTextView: UITextView!
    
    let userDefaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // restore Top Score
        if let value = userDefaults.value(forKey: "score") as? String {
        scoreTextView.text = value
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(getTopScore(_:)), name: Notification.Name("topScore"), object: nil)
    }
    
    @objc func getTopScore(_ notification: Notification) {
        let text = notification.object as! String?
        scoreTextView.text = text
        // save score
        userDefaults.setValue(scoreTextView.text, forKey: "score")
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "game") as! GameViewController
        vc.modalPresentationStyle = .fullScreen
        vc.previousScore = Int(scoreTextView.text) ?? 0
        present(vc, animated: true)
    }
    
}

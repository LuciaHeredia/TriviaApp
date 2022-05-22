//
//  ViewController.swift
//  Trivia
//
//  Created by lucia heredia on 21/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(getTopScore(_:)), name: Notification.Name("topScore"), object: nil)
    }
    
    @objc func getTopScore(_ notification: Notification) {
        let text = notification.object as! String?
        scoreTextView.text = text
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "game") as! GameViewController
        vc.modalPresentationStyle = .fullScreen
        // save in shared preferences
        present(vc, animated: true)
    }
    


}


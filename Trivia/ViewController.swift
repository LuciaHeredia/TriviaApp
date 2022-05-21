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
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "game") as! GameViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    


}


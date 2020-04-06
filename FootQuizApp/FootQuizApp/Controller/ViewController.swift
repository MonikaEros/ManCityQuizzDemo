//
//  ViewController.swift
//  FootQuizApp
//
//  Created by Yuriy Oksamytny on 06/04/2020.
//  Copyright © 2020 Yuriy Oksamytny. All rights reserved.
//

import UIKit
import SwiftyGif

class ViewController: UIViewController {

    
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionImage: UIImageView!
    
    @IBOutlet weak var playerAnswer: UITextField!
    
    @IBOutlet weak var submitButton: RoundButton!
    @IBOutlet weak var backButton: RoundButton!
    
    @IBOutlet weak var previousButton: RoundButton!
    @IBOutlet weak var nextButton: RoundButton!
    
    @IBOutlet weak var rulesButon: RoundRulesButton!
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.isHidden = true
        previousButton.isHidden = true
        nextButton.isHidden = true
//        questionImageView.image = UIImage(named: "Football.gif")
        do {
            let gif = try UIImage(gifName: "Football.gif")
            let imageview = UIImageView(gifImage: gif, loopCount: -1) // Use -1 for infinite loop
            imageview.frame = questionImageView.bounds
            questionImageView.addSubview(imageview)
        } catch {
            print(error)
        }
    

    }
    
    
    @IBAction func submitButtonPressed(_ sender: Any) {
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
    }
    @IBAction func previousButtonPressed(_ sender: Any) {
    }
    @IBAction func nextButtonPressed(_ sender: Any) {
    }
    @IBAction func rulesButtonPressed(_ sender: Any) {
    }
    
}


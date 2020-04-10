//
//  ViewController.swift
//  FootQuizApp
//
//  Created by Yuriy Oksamytny on 06/04/2020.
//  Copyright © 2020 Yuriy Oksamytny. All rights reserved.
//

import UIKit
import SwiftyGif
import JGProgressHUD

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
    @IBOutlet weak var progressBar: UIView!
    
    @IBOutlet weak var questionImageView: UIImageView!
    
    let allQuestion = QuestionBank()
    var questionNum = 0
    var Oks = Player()
    var playerQuestionsCounter = 0
    lazy var fakeAnswer = allQuestion.list[questionNum].mainQuestion.fakeAnswer
    lazy var correctAnswer = allQuestion.list[questionNum].mainQuestion.answer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionNumber.text = "Question #\(questionNum+1)"
        progressLabel.text = "\(questionNum+1)/11"
        scoreLabel.text = "Score: \(Oks.score)"
        let currentGif = allQuestion.list[0].mainQuestion.gifName
        showGif(gName: currentGif)
        backButton.isHidden = true
        previousButton.isHidden = true
        nextButton.isHidden = true
        progressBar.frame.size.width = (view.frame.size.width / 11) * CGFloat(questionNum)

    }
    
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        checkAnswer()
//        if playerAnswer.text == "Ok" {
//            backButton.isHidden = false
//            let currentGif = allQuestion.list[questionNum].additionalQuestionOne!.gifName
//            showGif(gName: currentGif)
//
//
//        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
    }
    @IBAction func previousButtonPressed(_ sender: Any) {
    }
    @IBAction func nextButtonPressed(_ sender: Any) {
    }
    @IBAction func rulesButtonPressed(_ sender: Any) {
    }
    
    
    func showGif(gName: String) {
        do {
            let gif = try UIImage(gifName: gName)
            let imageview = UIImageView(gifImage: gif, loopCount: -1) // Use -1 for infinite loop
            imageview.frame = questionImageView.bounds
            questionImageView.addSubview(imageview)
        } catch {
            print(error)
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in self.startOver() } )
        
        alert.addAction(restartAction)
        present(alert, animated: true, completion: nil)
    }
    
    func nextQuestion() {
        previousButton.isHidden = false
        nextButton.isHidden = false
        
        print("Value of the question#\(questionNum+1) : \(allQuestion.list[questionNum].mainQuestionValue)")
        print("Oks.score: \(Oks.score)")
                   
        
        questionNum += 1
        if questionNum <= 10 {
            questionNumber.text = "Question #\(questionNum+1)"
            progressLabel.text = "\(questionNum+1)/11"
            let currentGif = allQuestion.list[questionNum].mainQuestion.gifName
            showGif(gName: currentGif)
            scoreLabel.text = "Score: \(Oks.score)"
            progressBar.frame.size.width = (view.frame.size.width / 11) * CGFloat(questionNum)

        } else {
            print("End of the quizz next") // IMPORTANT !!!
            //questionNum = 0
            scoreLabel.text = "Score: \(Oks.score)"
            progressBar.frame.size.width = (view.frame.size.width / 11) * CGFloat(questionNum)
            showAlert(title: "CONGRATULATIONS!" , message:  "You've completed the quest! You are the winner!")
            
        }
        

        
    }
    
    func fakeQuestion() {
        backButton.isHidden = false
        questionNumber.text = "Question #\(questionNum+1).1"
        let currentGif = allQuestion.list[questionNum].additionalQuestionOne!.gifName
        showGif(gName: currentGif)
        correctAnswer = allQuestion.list[questionNum].additionalQuestionOne!.answer
        print(correctAnswer)
        switch playerAnswer.text {
        case correctAnswer:
            showAlert(title: "Well Done! ✅" , message:  "Keep going! Good luck!")
            print("Congratulations")
        default:
            showAlert(title: "❌ WRONG ❌" , message:  "Sorry! Try again!")
            print("Sorry, you are a loseer")
        }
    }
    
    func checkAnswer() {
        var rightAnswerValue = 0
        
        //print(Oks.questionsPassed["f\(questionNum+1)"]!)
        
//        if Oks.questionsPassed["f\(questionNum+1)"] == "not passed" {
            rightAnswerValue = allQuestion.list[questionNum].mainQuestionValue
            fakeAnswer = allQuestion.list[questionNum].mainQuestion.fakeAnswer
            correctAnswer = allQuestion.list[questionNum].mainQuestion.answer
  //      } else {
    //        rightAnswerValue = allQuestion.list[questionNum].additionalQuestionOneValue
      //  }
        
        print(correctAnswer)
        switch playerAnswer.text {
        case fakeAnswer:
            showAlert(title: "⚠️ YOU GOT CAUGHT ⚠️" , message:  "You can come back to original question and get your points back or keep trying! Good luck!")
            print("You got caught")
            Oks.score += allQuestion.list[questionNum].mainQuestionFakeValue
            backButton.isHidden = false
            Oks.questionsPassed["f\(questionNum+1)"] = "passed"
            print(Oks.score)
            fakeQuestion()
            
        case correctAnswer:
            showAlert(title: "WELL DONE ✅" , message:  "Keep going! Good luck!")
            print("Congratulations")
            Oks.questionsPassed["\(questionNum+1)"] = "passed"
            
            Oks.score += rightAnswerValue
            nextQuestion()
            
        default:
            showAlert(title: "❌ WRONG ❌" , message:  "Sorry! Try again!")
            print("Sorry, you are a loseer")
            
        }
        
        
    }
    
    func startOver() {
        
    }
}


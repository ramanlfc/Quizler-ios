//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    let questionBank = QuestionBank()
    var questionIndex = 0
    var currentAnswer : Bool!
    var score : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            currentAnswer = true
        }else{
            currentAnswer = false
        }
        
        checkAnswer()
        questionIndex = questionIndex + 1
        nextQuestion()
        
    }
    
    func updateUI() {
      
        progressLabel.text = "\(questionIndex + 1)/" + String(questionBank.list.count)
        scoreLabel.text = "Score: " + String(score) +  "/" + String(questionBank.list.count)
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(questionBank.list.count)) * CGFloat(questionIndex + 1)
        
    }

    func nextQuestion() {
        
        if(questionIndex >= questionBank.list.count){
            
            scoreLabel.text = "Score: " + String(score) +  "/" + String(questionBank.list.count) // last question score update
            
           let alertController = UIAlertController(title: "Restart", message: "Play Again?", preferredStyle: .alert)
            
           let alert = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
               self.startOver()
           })
            
           alertController.addAction(alert)
           present(alertController, animated: true, completion: nil)
        
           return
        }
        
        questionLabel.text = questionBank.list[questionIndex].text
        updateUI()
    }
    
    func checkAnswer() {
        
        if currentAnswer == questionBank.list[questionIndex].correctAnswer {
            score = score + 1
            ProgressHUD.showSuccess("Right")
        }else{
             ProgressHUD.showError("Wrong")
        }
        
    }
    
    func startOver() {
       
        questionIndex = 0
        score = 0
        nextQuestion()
        
    }
    
}

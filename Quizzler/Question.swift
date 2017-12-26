//
//  Question.swift
//  Quizzler
//
//  Created by Raman on 25/12/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

class Question{
    
    var text : String
    var correctAnswer : Bool
    
    init(text : String, correctAnswer : Bool) {
        self.text = text
        self.correctAnswer = correctAnswer
    }
    
}

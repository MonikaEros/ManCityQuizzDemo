//
//  Question.swift
//  FootQuizApp
//
//  Created by Yuriy Oksamytny on 06/04/2020.
//  Copyright © 2020 Yuriy Oksamytny. All rights reserved.
//

import Foundation

class Question {
    
    var gifName: String
    var questionNumber: String
    var answer : String

    init(gif: String, number: String, answer: String) {
        self.gifName = gif
        self.questionNumber = number
        self.answer = answer
    }

}

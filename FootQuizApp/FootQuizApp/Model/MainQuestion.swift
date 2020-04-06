//
//  MainQuestion.swift
//  FootQuizApp
//
//  Created by Yuriy Oksamytny on 06/04/2020.
//  Copyright © 2020 Yuriy Oksamytny. All rights reserved.
//

import Foundation

class MainQuestion : Question  {
    
    var fakeAnswer: String
    
    init(gif: String, number: String, answer: String, fakeAnswer: String) {
        self.fakeAnswer = fakeAnswer
        super.init(gif: gif, number: number, answer: answer)
    }
}

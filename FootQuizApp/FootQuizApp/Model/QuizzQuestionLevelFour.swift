//
//  QuizzQuestionLevelFour.swift
//  FootQuizApp
//
//  Created by Yuriy Oksamytny on 06/04/2020.
//  Copyright © 2020 Yuriy Oksamytny. All rights reserved.
//

import Foundation

class QuizzQuestionLevelFour: QuizzQuestion {
  
    override init(main: MainQuestion, additional: AdditionalQuestion) {
        super.init(main: main, additional: additional)
        self.mainQuestionValue = 200
        self.mainQuestionFakeValue = 0
        self.levelOfQuestion = 4
    }
        
}



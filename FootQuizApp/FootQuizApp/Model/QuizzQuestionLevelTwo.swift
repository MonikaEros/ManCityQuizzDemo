//
//  QuizzQuestionLevelTwo.swift
//  FootQuizApp
//
//  Created by Yuriy Oksamytny on 06/04/2020.
//  Copyright © 2020 Yuriy Oksamytny. All rights reserved.
//

import Foundation

class QuizzQuestionLevelTwo: QuizzQuestion {
  
    init(main: MainQuestion, additional: AdditionalQuestion, additional2: AdditionalQuestion) {
        super.init(main: main, additional: additional)
        self.additionalQuestionTwo = additional2
        self.mainQuestionValue = 20
        self.mainQuestionFakeValue = -10
        self.additionalQuestionOneValue = 15
        self.levelOfQuestion = 2
    }
        
}

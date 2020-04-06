//
//  QuizzQuestionLevelThree.swift
//  FootQuizApp
//
//  Created by Yuriy Oksamytny on 06/04/2020.
//  Copyright © 2020 Yuriy Oksamytny. All rights reserved.
//

import Foundation

class QuizzQuestionLevelThree: QuizzQuestion {
  
    init(main: MainQuestion, additional: AdditionalQuestion, additional2: AdditionalQuestion, additional3: AdditionalQuestion) {
        super.init(main: main, additional: additional)
        self.additionalQuestionTwo = additional2
        self.additionalQuestionThree = additional3
        self.mainQuestionValue = 30
        self.mainQuestionFakeValue = -20
        self.additionalQuestionOneValue = 25
        self.levelOfQuestion = 3
    }
        
}

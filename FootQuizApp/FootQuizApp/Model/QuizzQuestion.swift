//
//  QuizzQuestion.swift
//  FootQuizApp
//
//  Created by Yuriy Oksamytny on 06/04/2020.
//  Copyright © 2020 Yuriy Oksamytny. All rights reserved.
//

import Foundation

class QuizzQuestion {
    var mainQuestion : MainQuestion
    var additionalQuestionOne: AdditionalQuestion?
    var additionalQuestionTwo: AdditionalQuestion?
    var additionalQuestionThree: AdditionalQuestion?

    var mainQuestionValue = 10
    var mainQuestionFakeValue = -5
    var additionalQuestionOneValue = 8
    var levelOfQuestion = 1
    
    init(main: MainQuestion, additional: AdditionalQuestion) {
        self.mainQuestion = main
        self.additionalQuestionOne = additional
    }


}

//
//  QuestionBank.swift
//  FootQuizApp
//
//  Created by Yuriy Oksamytny on 06/04/2020.
//  Copyright © 2020 Yuriy Oksamytny. All rights reserved.
//

import Foundation

class QuestionBank {
    
    init() {
        
    }
    lazy var dictOfAnswers = ["Answer1" : "1",
                         "FakeAnswer1" : "1",
                         "AddAnswer1.1" : "1",
                         
                         "Answer2" : "1",
                         "FakeAnswer2" : "1",
                         "AddAnswer2.1" : "1",
                         
                         "Answer3" : "1",
                         "FakeAnswer3" : "1",
                         "AddAnswer3.1" : "1",
                         "AddAnswer3.2" : "1",
                         
                         "Answer4" : "1",
                         "FakeAnswer4" : "1",
                         "AddAnswer4.1" : "1",
                         "AddAnswer4.2" : "1",
                         
                         "Answer5" : "1",
                         "FakeAnswer5" : "1",
                         "AddAnswer5.1" : "1",
                         "AddAnswer5.2" : "1",
                        
                         "Answer6" : "1",
                         "FakeAnswer6" : "1",
                         "AddAnswer6.1" : "1",
                         "AddAnswer6.2" : "1",
                         "AddAnswer6.3" : "1",
                         
                         "Answer7" : "1",
                         "FakeAnswer7" : "1",
                         "AddAnswer7.1" : "1",
                         "AddAnswer7.2" : "1",
                         "AddAnswer7.3" : "1",
                         
                         "Answer8" : "1",
                         "FakeAnswer8" : "1",
                         "AddAnswer8.1" : "1",
                         "AddAnswer8.2" : "1",
                         "AddAnswer8.3" : "1",
                         
                         "Answer9" : "1",
                         "FakeAnswer9" : "1",
                         "AddAnswer9.1" : "1",
                         "AddAnswer9.2" : "1",
                         "AddAnswer9.3" : "1",
                         
                         "Answer10" : "1",
                         "Answer11" : "1"]
                         
    
    lazy var question_1 = MainQuestion(gif: "question_1.gif", number: "1", answer: dictOfAnswers["Answer1"]!, fakeAnswer: dictOfAnswers["FakeAnswer1"]!)
    lazy var question_2 = MainQuestion(gif: "question_2.gif", number: "2", answer: dictOfAnswers["Answer2"]!, fakeAnswer: dictOfAnswers["FakeAnswer2"]!)
    lazy var question_3 = MainQuestion(gif: "question_3.gif", number: "3", answer: dictOfAnswers["Answer3"]!, fakeAnswer: dictOfAnswers["FakeAnswer3"]!)
    lazy var question_4 = MainQuestion(gif: "question_4.gif", number: "4", answer: dictOfAnswers["Answer4"]!, fakeAnswer: dictOfAnswers["FakeAnswer4"]!)
    lazy var question_5 = MainQuestion(gif: "question_5.gif", number: "5", answer: dictOfAnswers["Answer5"]!, fakeAnswer: dictOfAnswers["FakeAnswer5"]!)
    lazy var question_6 = MainQuestion(gif: "question_6.gif", number: "6", answer: dictOfAnswers["Answer6"]!, fakeAnswer: dictOfAnswers["FakeAnswer6"]!)
    lazy var question_7 = MainQuestion(gif: "question_7.gif", number: "7", answer: dictOfAnswers["Answer7"]!, fakeAnswer: dictOfAnswers["FakeAnswer7"]!)
    lazy var question_8 = MainQuestion(gif: "question_8.gif", number: "8", answer: dictOfAnswers["Answer8"]!, fakeAnswer: dictOfAnswers["FakeAnswer8"]!)
    lazy var question_9 = MainQuestion(gif: "question_9.gif", number: "9", answer: dictOfAnswers["Answer9"]!, fakeAnswer: dictOfAnswers["FakeAnswer9"]!)
    lazy var question_10 = MainQuestion(gif: "question_10.gif", number: "10", answer: dictOfAnswers["Answer10"]!, fakeAnswer: dictOfAnswers["FakeAnswer10"]!)
    lazy var question_11 = MainQuestion(gif: "question_11.gif", number: "11", answer: dictOfAnswers["Answer11"]!, fakeAnswer: dictOfAnswers["FakeAnswer11"]!)


    lazy var question_1_1 = AdditionalQuestion(gif: "question_1_1.gif", number: "1.1", answer: dictOfAnswers["AddAnswer1.1"]!)
    lazy var question_2_1 = AdditionalQuestion(gif: "question_2_1.gif", number: "2.1", answer: dictOfAnswers["AddAnswer2.1"]!)
    lazy var question_3_1 = AdditionalQuestion(gif: "question_3_1.gif", number: "3.1", answer: dictOfAnswers["AddAnswer3.1"]!)
    lazy var question_3_2 = AdditionalQuestion(gif: "question_3_2.gif", number: "3.2", answer: dictOfAnswers["AddAnswer3.2"]!)
    lazy var question_4_1 = AdditionalQuestion(gif: "question_4_1.gif", number: "4.1", answer: dictOfAnswers["AddAnswer4.1"]!)
    lazy var question_4_2 = AdditionalQuestion(gif: "question_4_2.gif", number: "4.2", answer: dictOfAnswers["AddAnswer4.2"]!)
    lazy var question_5_1 = AdditionalQuestion(gif: "question_5_1.gif", number: "5.1", answer: dictOfAnswers["AddAnswer5.1"]!)
    lazy var question_5_2 = AdditionalQuestion(gif: "question_5_2.gif", number: "5.2", answer: dictOfAnswers["AddAnswer5.2"]!)
    lazy var question_6_1 = AdditionalQuestion(gif: "question_6_1.gif", number: "6.1", answer: dictOfAnswers["AddAnswer6.1"]!)
    lazy var question_6_2 = AdditionalQuestion(gif: "question_6_2.gif", number: "6.2", answer: dictOfAnswers["AddAnswer6.2"]!)
    lazy var question_6_3 = AdditionalQuestion(gif: "question_6_3.gif", number: "6.3", answer: dictOfAnswers["AddAnswer6.3"]!)
    lazy var question_7_1 = AdditionalQuestion(gif: "question_7_1.gif", number: "7.1", answer: dictOfAnswers["AddAnswer7.1"]!)
    lazy var question_7_2 = AdditionalQuestion(gif: "question_7_2.gif", number: "7.2", answer: dictOfAnswers["AddAnswer7.2"]!)
    lazy var question_7_3 = AdditionalQuestion(gif: "question_7_3.gif", number: "7.3", answer: dictOfAnswers["AddAnswer7.3"]!)
    lazy var question_8_1 = AdditionalQuestion(gif: "question_8_1.gif", number: "8.1", answer: dictOfAnswers["AddAnswer8.1"]!)
    lazy var question_8_2 = AdditionalQuestion(gif: "question_8_2.gif", number: "8.2", answer: dictOfAnswers["AddAnswer8.2"]!)
    lazy var question_8_3 = AdditionalQuestion(gif: "question_8_3.gif", number: "8.3", answer: dictOfAnswers["AddAnswer8.3"]!)
    lazy var question_9_1 = AdditionalQuestion(gif: "question_9_1.gif", number: "9.1", answer: dictOfAnswers["AddAnswer9.1"]!)
    lazy var question_9_2 = AdditionalQuestion(gif: "question_9_2.gif", number: "9.2", answer: dictOfAnswers["AddAnswer9.2"]!)
    lazy var question_9_3 = AdditionalQuestion(gif: "question_9_3.gif", number: "9.3", answer: dictOfAnswers["AddAnswer9.3"]!)
    
    
    lazy var question1 = QuizzQuestionLevelOne(main: question_1, additional: question_1_1)
    lazy var question2 = QuizzQuestionLevelOne(main: question_2, additional: question_2_1)
    lazy var question3 = QuizzQuestionLevelTwo(main: question_3, additional: question_3_1, additional2: question_3_2)
    lazy var question4 = QuizzQuestionLevelTwo(main: question_4, additional: question_4_1, additional2: question_4_2)
    lazy var question5 = QuizzQuestionLevelTwo(main: question_5, additional: question_5_1, additional2: question_5_2)
    lazy var question6 = QuizzQuestionLevelThree(main: question_6, additional: question_6_1, additional2: question_6_2, additional3: question_6_3)
    lazy var question7 = QuizzQuestionLevelThree(main: question_7, additional: question_7_1, additional2: question_7_2, additional3: question_7_3)
    lazy var question8 = QuizzQuestionLevelThree(main: question_8, additional: question_8_1, additional2: question_8_2, additional3: question_8_3)
    lazy var question9 = QuizzQuestionLevelThree(main: question_9, additional: question_9_1, additional2: question_9_2, additional3: question_9_3)
    lazy var question10 = QuizzQuestionLevelFour(main: question_10, additional: question_1_1)
    lazy var question11 = QuizzQuestionLevelFive(main: question_11, additional: question_1_1)
    
    lazy var list = [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, question11]
}

import UIKit

protocol QuestitonProtocol {
    var answer : Bool {get set}
    var value : Int {get set}
}

protocol MainQuestionProtocol {
    var fake : Bool {get set}
    var value : Int {get set}
    var fakeValue: Int {get set}
}

protocol AdditionaQuestionProtocol: QuestitonProtocol {

}

protocol QuizzQuestionProtocol {
    var previousQuestion: QuizzQuestion? {get set}
    var mainQuestion : MainQuestion {get set}
    var additionalQuestionOne: AdditionalQuestion? {get set}
    var additionalQuestionTwo: AdditionalQuestion? {get set}
    var additionalQuestionThree: AdditionalQuestion? {get set}
    var passedStatus: Bool {get set}

}

public func true_false_randomizer() -> Bool {
    let number = Int.random(in: 0 ..< 10)
    
    if number <= 6 {
        return true
    } else {
        return false
    }
}

class Question : QuestitonProtocol {
    
    var answer : Bool
    var value : Int

    init() {
        self.answer = Bool()
        self.value = Int()
    }
}

class AdditionalQuestion : Question, AdditionaQuestionProtocol {
    
}

class MainQuestion : Question, MainQuestionProtocol  {
    
    var fakeValue : Int
    var fake : Bool
    
    override init() {
        self.fake = Bool()
        self.fakeValue = Int()
    }
}

class QuizzQuestion: QuizzQuestionProtocol {

    var previousQuestion: QuizzQuestion?
    var mainQuestion : MainQuestion
    var additionalQuestionOne: AdditionalQuestion?
    var additionalQuestionTwo: AdditionalQuestion?
    var additionalQuestionThree: AdditionalQuestion?
    var passedStatus: Bool
    var mainQuestionValue = 10
    var mainQuestionFakeValue = -5
    var additionalQuestionOneValue = 8
    var levelOfQuestion = 1
    var localMainValue = 0
    var localAdditionalValue = 0
    var localAnswer : Bool
    var localFake : Bool
  
    
    
    init() {
        self.mainQuestion = MainQuestion()
        self.mainQuestion.answer = true_false_randomizer()
        self.additionalQuestionOne = AdditionalQuestion()
        self.additionalQuestionTwo = AdditionalQuestion()
        self.additionalQuestionThree = AdditionalQuestion()
        self.passedStatus = true
        self.localAnswer = Bool()
        self.localFake = Bool()
    }
    
    func checkPreviousQuestion() {
        if self.previousQuestion != nil {
            if self.previousQuestion?.passedStatus == false {
                self.passedStatus = false
                print("Current status:", self.passedStatus)
            }
        }
    }

    func setValues() {
        self.mainQuestion.value = mainQuestionValue
        self.mainQuestion.fakeValue = mainQuestionFakeValue
        self.additionalQuestionOne?.value = additionalQuestionOneValue
        self.additionalQuestionTwo?.value = additionalQuestionOneValue
        self.additionalQuestionThree?.value = additionalQuestionOneValue
        self.mainQuestion.answer = true_false_randomizer()
        localAnswer = self.mainQuestion.answer
        print("Answer: ", localAnswer)
        self.passedStatus = true
    }
    
    func checkMainQuestion(valueMain: Int) {
        if localAnswer {
            localMainValue = valueMain;
            self.passedStatus = true
        } else {
            self.mainQuestion.fake = true_false_randomizer()
            localFake = self.mainQuestion.fake
        }
    }
    
    func checkAdditionalQuestion(valueAdditional: Int) {

        if localFake {
            localMainValue = mainQuestionFakeValue
            self.additionalQuestionOne!.answer = true_false_randomizer()
            let localAdditionalAnswer = self.additionalQuestionOne!.answer
            
            if localAdditionalAnswer {
                localAdditionalValue = additionalQuestionOneValue
                self.passedStatus = true
            } else {
                   localMainValue = 0
                   self.passedStatus = false
            }
       }
    }
    
    func getValues() -> [Int] {
        
        var arrayOfNumbers: [Int]
        print("We will check previous question now")
        checkPreviousQuestion()

        if self.passedStatus == false {
            return [localMainValue,localAdditionalValue] // (0, 0), status: false
        }
        print("We will set value now")

        setValues()
        print("We will check main question now")

        checkMainQuestion(valueMain: mainQuestionValue)
        print("We checked main question now")

        if self.passedStatus == true {
            return [localMainValue,localAdditionalValue] // (10, 10)
        }
        print("We are still here? Then answer is wrong")
        arrayOfNumbers = [localMainValue]
        
        for additionalQuestionNumber in 1...levelOfQuestion {
            checkAdditionalQuestion(valueAdditional: additionalQuestionOneValue)
            if localAdditionalValue != 0 {
                arrayOfNumbers[additionalQuestionNumber] = localAdditionalValue
                self.passedStatus = true
            } else {
                for i in additionalQuestionNumber...levelOfQuestion {
                    arrayOfNumbers[i] = 0
                }
            }
        }
            
        return arrayOfNumbers
        
    }
    
    
}

class QuizzQuestionLevelOne: QuizzQuestion {

    override init() {
    }
        
}


class QuizzQuestionLevelTwo: QuizzQuestion {
  
    override init() {
        super.init()
        self.mainQuestionValue = 20
        self.mainQuestionFakeValue = -10
        self.additionalQuestionOneValue = 15
        self.levelOfQuestion = 2
    }
        
}


class QuizzQuestionLevelThree: QuizzQuestion {
  
    override init() {
        super.init()
        self.mainQuestionValue = 30
        self.mainQuestionFakeValue = -20
        self.additionalQuestionOneValue = 25
        self.levelOfQuestion = 3
    }
        
}
        
print("Question 1:")
var question_1_0 = QuizzQuestionLevelOne()
question_1_0.getValues()
question_1_0.passedStatus
print("Question 2:")

var question_2_0 = QuizzQuestionLevelOne()
question_2_0.previousQuestion = question_1_0
question_2_0.previousQuestion?.passedStatus
question_2_0.getValues()
question_2_0.passedStatus

print("Question 3:")
var question_3_0 = QuizzQuestionLevelTwo()
question_3_0.previousQuestion = question_2_0
question_3_0.previousQuestion?.passedStatus
question_3_0.getValues()
question_3_0.passedStatus

////var question_4_0 = QuizzQuestionLevelTwo(previousQuestion: question_3_0)
////question_4_0.getValues()
////question_4_0.passedStatus
////var question_5_0 = QuizzQuestionLevelTwo(previousQuestion: question_4_0)
////question_5_0.getValues()
////question_5_0.passedStatus
////var question_6_0 = QuizzQuestionLevelTwo(previousQuestion: question_5_0)
////question_6_0.getValues()
////question_6_0.passedStatus
////var question_7_0 = QuizzQuestionLevelTwo(previousQuestion: question_6_0)
////question_7_0.getValues()
////question_7_0.passedStatus
////var question_8_0 = QuizzQuestionLevelTwo(previousQuestion: question_7_0)
////question_8_0.getValues()
////question_8_0.passedStatus
//

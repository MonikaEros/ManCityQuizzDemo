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

    var mainQuestion : MainQuestion {get set}
    var additionalQuestionOne: AdditionalQuestion? {get set}
    var additionalQuestionTwo: AdditionalQuestion? {get set}
    var additionalQuestionThree: AdditionalQuestion? {get set}
    var passedStatus: Bool {get set}

}

public func true_false_randomizer() -> Bool {
    let number = Int.random(in: 0 ..< 10)
    
    if number <= 4 {
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
        
    var mainQuestion : MainQuestion
    var additionalQuestionOne: AdditionalQuestion?
    var additionalQuestionTwo: AdditionalQuestion?
    var additionalQuestionThree: AdditionalQuestion?
    var passedStatus: Bool

    init() {
        self.mainQuestion = MainQuestion()
        self.mainQuestion.answer = true_false_randomizer()
        self.additionalQuestionOne = AdditionalQuestion()
        self.additionalQuestionTwo = AdditionalQuestion()
        self.additionalQuestionThree = AdditionalQuestion()
        self.passedStatus = Bool()
    }
}

class QuizzQuestionLevelOne: QuizzQuestion {
    
    var previousQuestion: QuizzQuestion?

    override init() {
        //self.previousQuestion = previousQuestion!
    }

    func setValues() {
        self.mainQuestion.value = 10
        self.mainQuestion.fakeValue = -5
        self.additionalQuestionOne?.value = 8
    }
    
    func getValues() -> (Int, Int) {
 
        var localMainValue = 0
        var localAdditionalValue = 0;
        
        if self.previousQuestion != nil {
            if self.previousQuestion?.passedStatus == false {
                self.passedStatus = false
                return (localMainValue,localAdditionalValue) // (0, 0), status: false
            }
        }
        
        self.mainQuestion.answer = true_false_randomizer()
        let localAnswer = self.mainQuestion.answer
        self.mainQuestion.fake = true_false_randomizer()
        let localFake = self.mainQuestion.fake

       
        if localAnswer {
            localMainValue = 10;
            self.passedStatus = true
            return (localMainValue, localAdditionalValue) // (10, 10)
        } else {
            if localFake {
                localMainValue = -5
                self.additionalQuestionOne!.answer = true_false_randomizer()
                let localAdditionalAnswer = self.additionalQuestionOne!.answer
                
                if localAdditionalAnswer { 
                    localAdditionalValue = 8
                    self.passedStatus = true
                    print("STATUS SUKA: ", self.passedStatus)
                }
                return(localMainValue, localAdditionalValue)
                 
            } else {
                localMainValue = 0
                self.passedStatus = false
                return (localMainValue,localAdditionalValue) // (0, 0)
            }
        }
        
 
        }
    }

class QuizzQuestionLevelTwo: QuizzQuestion {
       
   var previousQuestion: QuizzQuestion
   
   init(previousQuestion: QuizzQuestion) {
    self.previousQuestion = previousQuestion
   }
   
   func getValues() -> (Int, Int) {

       var localMainValue = 0
       var localAdditionalValue = 0;

       if self.previousQuestion.passedStatus == false {
           self.passedStatus = false
           return (localMainValue,localAdditionalValue) // (0, 0), status: false
       }
       
       self.mainQuestion.answer = true_false_randomizer()
       let localAnswer = self.mainQuestion.answer
       self.mainQuestion.fake = true_false_randomizer()
       let localFake = self.mainQuestion.fake

       self.passedStatus = false

      
       if localAnswer {
           localMainValue = 10;
           self.passedStatus = true
           return (localMainValue, localAdditionalValue) // (10, 10), status: true
       } else {
           if localFake {
               localMainValue = -5
               self.additionalQuestionOne!.answer = true_false_randomizer()
               let localAdditionalAnswer = self.additionalQuestionOne!.answer
               
               if localAdditionalAnswer {
                   localAdditionalValue = 8
                   self.passedStatus = true // (-5, 8), status: true
               }
               return(localMainValue, localAdditionalValue) // (0, 0), status: false
                
           } else {
               localMainValue = 0
               return (localMainValue,localAdditionalValue) // (0, 0), status: false
           }
       }
       
       }
   }

var question_1_0 = QuizzQuestionLevelOne()
question_1_0.getValues()
question_1_0.passedStatus

var question_2_0 = QuizzQuestionLevelOne()
question_2_0.previousQuestion = question_1_0
question_2_0.previousQuestion?.passedStatus
question_2_0.getValues()
question_2_0.passedStatus

var question_3_0 = QuizzQuestionLevelTwo(previousQuestion: question_2_0)
question_3_0.previousQuestion.passedStatus
question_3_0.getValues()
question_3_0.passedStatus

var question_4_0 = QuizzQuestionLevelTwo(previousQuestion: question_3_0)
question_4_0.getValues()
question_4_0.passedStatus
var question_5_0 = QuizzQuestionLevelTwo(previousQuestion: question_4_0)
question_5_0.getValues()
question_5_0.passedStatus
var question_6_0 = QuizzQuestionLevelTwo(previousQuestion: question_5_0)
question_6_0.getValues()
question_6_0.passedStatus
var question_7_0 = QuizzQuestionLevelTwo(previousQuestion: question_6_0)
question_7_0.getValues()
question_7_0.passedStatus
var question_8_0 = QuizzQuestionLevelTwo(previousQuestion: question_7_0)
question_8_0.getValues()
question_8_0.passedStatus



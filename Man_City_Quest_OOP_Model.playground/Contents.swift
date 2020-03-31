import UIKit

protocol QuestitonProtocol {
    var answer : Bool {get set}
    var value : Int {get set}
    var passedStatus: Bool {get set}

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

}

public func true_false_randomizer(value: Int) -> Bool {
    return value >= Int.random(in: 0 ..< 10)
}

var mainBool = 4
var fakeBool = 9
var firstBool = 9
var secondBool = 8
var thirdBool = 7
var preFinalBool = 2
var finalBool = 1

public func createArray(lvlNumber: Int) -> [Int] {
    var arr = [Int]()
    for _ in 0...lvlNumber {
        arr.append(0)
    }
    return arr
}

class Question : QuestitonProtocol {
    
    var passedStatus: Bool
    var answer : Bool
    var value : Int

    init() {
        self.answer = Bool()
        self.value = Int()
        self.passedStatus = Bool()
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

class QuizzQuestion: Question, QuizzQuestionProtocol  {

    var previousQuestion: QuizzQuestion?
    var mainQuestion : MainQuestion
    var additionalQuestionOne: AdditionalQuestion?
    var additionalQuestionTwo: AdditionalQuestion?
    var additionalQuestionThree: AdditionalQuestion?

    var mainQuestionValue = 10
    var mainQuestionFakeValue = -5
    var additionalQuestionOneValue = 8
    var levelOfQuestion = 1
    var localMainValue = 0
    var localAdditionalValue = 0
    var localAnswer : Bool
    var localFake : Bool
  
    
    
    override init() {
        self.mainQuestion = MainQuestion()
        self.mainQuestion.answer = true_false_randomizer(value: mainBool)
        self.additionalQuestionOne = AdditionalQuestion()
        self.additionalQuestionTwo = AdditionalQuestion()
        self.additionalQuestionThree = AdditionalQuestion()
        self.localAnswer = Bool()
        self.localFake = Bool()
        super.init()
        self.passedStatus = true
        self.mainQuestion.answer = true_false_randomizer(value: mainBool)

    }
    

    
    func checkPreviousQuestion() {
        if self.previousQuestion != nil {
            if self.previousQuestion?.passedStatus == false {
                self.passedStatus = false
//                print("Current status:", self.passedStatus)
            }
        }
    }

    func setValues() {
        self.mainQuestion.value = mainQuestionValue
        self.mainQuestion.fakeValue = mainQuestionFakeValue
        self.additionalQuestionOne?.value = additionalQuestionOneValue
        self.additionalQuestionOne?.passedStatus = true_false_randomizer(value: firstBool)
        self.additionalQuestionTwo?.value = additionalQuestionOneValue
        self.additionalQuestionTwo?.passedStatus = true_false_randomizer(value: secondBool)
        self.additionalQuestionThree?.value = additionalQuestionOneValue
        self.additionalQuestionThree?.passedStatus = true_false_randomizer(value: thirdBool)

        localAnswer = self.mainQuestion.answer
        self.passedStatus = true
    }
    
    func checkMainQuestion(valueMain: Int) {
        if localAnswer {
            localMainValue = valueMain;
            self.passedStatus = true
//            print("Status: ", self.passedStatus)

        } else {
            self.passedStatus = false
//            print("Status: ", self.passedStatus)
            self.mainQuestion.fake = true_false_randomizer(value: fakeBool)
            localFake = self.mainQuestion.fake
        }
    }
    
    func checkAdditionalQuestions() -> [Int] {
        
        var arrayOfValues : [Int]
        arrayOfValues = createArray(lvlNumber: self.levelOfQuestion)

//        print("Current fake status of main question answer:", localFake)

        if localFake == false {
            return arrayOfValues
        } else {
            arrayOfValues[0] = mainQuestionFakeValue
            switch self.levelOfQuestion {
            case 0:
                return [0]
            case 1:
//                print("1st additional question status: ", self.additionalQuestionOne!.passedStatus)
                if self.additionalQuestionOne!.passedStatus {
                    arrayOfValues[1] = self.additionalQuestionOne!.value
                } else {
                    return arrayOfValues
                }
            case 2:
//                print("1st additional question status: ", self.additionalQuestionOne!.passedStatus)
//                print("2nd additional question status: ", self.additionalQuestionTwo!.passedStatus)
                if (self.additionalQuestionOne!.passedStatus && self.additionalQuestionTwo!.passedStatus) {
                    arrayOfValues[1] = self.additionalQuestionOne!.value
                    arrayOfValues[2] = self.additionalQuestionTwo!.value
                } else {
                    return arrayOfValues
                }
            default:
//                print("1st additional question status: ", self.additionalQuestionOne!.passedStatus)
//                print("2nd additional question status: ", self.additionalQuestionTwo!.passedStatus)
//                print("3rd additional question status: ", self.additionalQuestionThree!.passedStatus)
                if (self.additionalQuestionOne!.passedStatus && self.additionalQuestionTwo!.passedStatus && self.additionalQuestionThree!.passedStatus) {
                    arrayOfValues[1] = self.additionalQuestionOne!.value
                    arrayOfValues[2] = self.additionalQuestionTwo!.value
                    arrayOfValues[3] = self.additionalQuestionThree!.value
                } else {
                    return arrayOfValues
                }
            }
        }
        
        self.passedStatus = true
//        print("Test array of additional answers: ", arrayOfValues)
        return arrayOfValues

    }
    

    func getValues() -> [Int] {
        
        var arrayOfNumbers = createArray(lvlNumber: levelOfQuestion)
        
//        print("We will check previous question now")
        
        checkPreviousQuestion()
        
//        print("Past status now is: ", self.passedStatus)
        
        if self.passedStatus == false {
            self.passedStatus = false
            return arrayOfNumbers // (0, 0), status: false   or    (0, 0, 0), status: false    (30, 0, 0, 0), status: false
        }
        
//        print("We will set value now")

        setValues()
        
//        print("We will check main question now")

        checkMainQuestion(valueMain: mainQuestionValue)
       
//        print("We checked main question now")

        if self.passedStatus == true {
            arrayOfNumbers[0] = localMainValue
            return arrayOfNumbers // (10, 0), status: false   or    (20, 0, 0), status: false    (30, 0, 0, 0), status: false
        } else {
            arrayOfNumbers[0] = localMainValue
        }
        

//        print("We are still here? Then we are checking additional questions now")
        
        arrayOfNumbers = checkAdditionalQuestions()
        
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
        self.previousQuestion = QuizzQuestion()
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

class QuizzQuestionLevelFour: QuizzQuestion {
  
    override init() {
        super.init()
        self.mainQuestionValue = 200
        self.mainQuestionFakeValue = 0
        self.levelOfQuestion = 0
        self.mainQuestion.answer = true_false_randomizer(value: preFinalBool)

    }
        
}

class QuizzQuestionLevelFive: QuizzQuestion {
  
    override init() {
        super.init()
        self.mainQuestionValue = 500
        self.mainQuestionFakeValue = 0
        self.levelOfQuestion = 0
        self.mainQuestion.answer = true_false_randomizer(value: finalBool)
    }
        
}


var someString = """
"""


for _ in 1...3 {
    
    var finalArray : [Int]
    finalArray = []

    let question_1_0 = QuizzQuestionLevelOne()

    let question_2_0 = QuizzQuestionLevelOne()
    question_2_0.previousQuestion = question_1_0

    let question_3_0 = QuizzQuestionLevelTwo()
    question_3_0.previousQuestion = question_2_0

    let question_4_0 = QuizzQuestionLevelTwo()
    question_4_0.previousQuestion = question_3_0

    let question_5_0 = QuizzQuestionLevelTwo()
    question_5_0.previousQuestion = question_4_0

    let question_6_0 = QuizzQuestionLevelThree()
    question_6_0.previousQuestion = question_5_0

    let question_7_0 = QuizzQuestionLevelThree()
    question_7_0.previousQuestion = question_6_0

    let question_8_0 = QuizzQuestionLevelThree()
    question_8_0.previousQuestion = question_7_0

    let question_9_0 = QuizzQuestionLevelThree()
    question_9_0.previousQuestion = question_8_0

    let question_10_0 = QuizzQuestionLevelFour()
    question_10_0.previousQuestion = question_9_0

    let question_11_0 = QuizzQuestionLevelFive()
    question_11_0.previousQuestion = question_10_0


    let arrayOfQuestions = [question_1_0, question_2_0, question_3_0, question_4_0, question_5_0, question_6_0, question_7_0, question_8_0, question_9_0, question_10_0, question_11_0]


    arrayOfQuestions.forEach{ value in
        finalArray += value.getValues()
    }
    
    print(finalArray)

    
    for item in finalArray {
        //    print(item, item)
        someString += String(item)
        someString += "\n"
    }
}




print(someString)

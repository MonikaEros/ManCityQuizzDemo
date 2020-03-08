import UIKit

func true_false_randomizer() -> Bool {
    let number = Int.random(in: 0 ..< 10)
    if number <= 8 {
        return true
    } else {
        return false
    }
}

func level_1_main_question(answer: Bool) ->  Int {
    let fake = Bool.random()
    
    if answer {
        return 10;
    } else {
        if fake {
            return  -5
        } else {
            return  0
        }
    }
}

func level_1_additional_question(answer: Bool) ->  Int {
    if answer {
        return 8;
    } else {
            return  0
    }
}

func level_1_previos_question(points: [String:Int], answer: Bool) ->  Int {
    if (points["q1.0"]! > 0 || points["q1.1"]! > 0) {

        return level_1_main_question(answer: answer)
    } else {
        return 0
    }
}

func level_2_main_question(points: [String:Int], answer: Bool, number: String) ->  Int {
    
    var sum : Int;
    
    switch number {
    case "q3.0":
        sum = points["q2.0"]! + points["q2.1"]!
    case "q4.0":
        sum = points["q3.0"]! + points["q3.1"]! + points["q3.2"]!
    default:
        sum = points["q4.0"]! + points["q4.1"]! + points["q4.2"]!
    }
    
    if sum == 20 {
    
        let fake = Bool.random()
        
        if answer {
            return 20;
        } else {
            if fake {
                return  -10
            } else {
                return  0
            }
        }
    } else {
        return 0
    }
}

func level_2_additional_question(answer: Bool) ->  Int {
    if answer {
        return 15;
    } else {
            return  0
    }
}

func level_3_main_question(points: [String:Int], answer: Bool, number: String) ->  Int {
    
    var sum : Int;
    
    switch number {
    case "q6.0":
        sum = points["q5.0"]! + points["q5.1"]! + points["q5.2"]!
    case "q7.0":
        sum = points["q6.0"]! + points["q6.1"]! + points["q6.2"]! + points["q6.3"]!
    case "q8.0":
        sum = points["q7.0"]! + points["q7.1"]! + points["q7.2"]! + points["q7.3"]!
    default:
        sum = points["q8.0"]! + points["q8.1"]! + points["q8.2"]! + points["q8.3"]!
    }
    
    if (sum == 20 || sum == 30 || sum == 55 ) {
    
        let fake = Bool.random()
        
        if answer {
            return 30;
        } else {
            if fake {
                return  -20
            } else {
                return  0
            }
        }
    } else {
        return 0
    }
}

func level_3_additional_question(answer: Bool) ->  Int {
    if answer {
        return 25;
    } else {
            return  0
    }
}

let q_1_0 = true_false_randomizer()
let q_1_1 = true_false_randomizer()
let q_2_0 = true_false_randomizer()
let q_2_1 = true_false_randomizer()
let q_3_0 = true_false_randomizer()
let q_3_1 = true_false_randomizer()
let q_3_2 = true_false_randomizer()
let q_4_0 = true_false_randomizer()
let q_4_1 = true_false_randomizer()
let q_4_2 = true_false_randomizer()
let q_5_0 = true_false_randomizer()
let q_5_1 = true_false_randomizer()
let q_5_2 = true_false_randomizer()
let q_6_0 = true_false_randomizer()
let q_6_1 = true_false_randomizer()
let q_6_2 = true_false_randomizer()
let q_6_3 = true_false_randomizer()
let q_7_0 = true_false_randomizer()
let q_7_1 = true_false_randomizer()
let q_7_2 = true_false_randomizer()
let q_7_3 = true_false_randomizer()
let q_8_0 = true_false_randomizer()
let q_8_1 = true_false_randomizer()
let q_8_2 = true_false_randomizer()
let q_8_3 = true_false_randomizer()
let q_9_0 = true_false_randomizer()
let q_9_1 = true_false_randomizer()
let q_9_2 = true_false_randomizer()
let q_9_3 = true_false_randomizer()
let q_10_0 = true_false_randomizer()
let q_11_0 = true_false_randomizer()

var array_points: [String: Int] = [:]



//MARK: - Questions: 1.0 , 1.1
/***************************************************************/

var q_1_0_points : Int
var q_1_1_points : Int
q_1_0_points  = level_1_main_question(answer: q_1_0)
array_points["q1.0"] = q_1_0_points

if q_1_0_points < 0 {
    q_1_1_points = level_1_additional_question(answer: q_1_1)
}  else {
    q_1_1_points = 0
}

array_points["q1.1"] = q_1_1_points
array_points["-"] = 0

//MARK: - Questions: 2.0 , 2.1
/***************************************************************/

var q_2_0_points : Int
var q_2_1_points : Int

q_2_0_points = level_1_previos_question(points: array_points, answer: q_2_0)
array_points["q2.0"] = q_2_0_points

if q_2_0_points < 0 {
        q_2_1_points = level_1_additional_question(answer: q_2_1)
    }  else {
        q_2_1_points = 0
}


array_points["q2.1"] = q_1_1_points
array_points["--"] = 0


//MARK: - Questions: 3.0 , 3.1, 3.2
/***************************************************************/

var q_3_0_points : Int
var q_3_1_points : Int
var q_3_2_points : Int
q_3_0_points  = level_2_main_question(points: array_points, answer: q_3_0, number: "q3.0")
array_points["q3.0"] = q_3_0_points

if q_3_0_points < 0 {
    q_3_1_points = level_2_additional_question(answer: q_3_1)
}  else {
    q_3_1_points = 0
}
array_points["q3.1"] = q_3_1_points

if (q_3_0_points + q_3_1_points == 5) {
    q_3_2_points = level_2_additional_question(answer: q_3_2)
}  else {
    q_3_2_points = 0
}

array_points["q3.2"] = q_3_2_points

//MARK: - Questions: 4.0 , 4.1, 4.2
/***************************************************************/

var q_4_0_points : Int
var q_4_1_points : Int
var q_4_2_points : Int
q_4_0_points  = level_2_main_question(points: array_points, answer: q_4_0, number: "q4.0")
array_points["q4.0"] = q_4_0_points

if q_4_0_points < 0 {
    q_4_1_points = level_2_additional_question(answer: q_4_1)
}  else {
    q_4_1_points = 0
}
array_points["q4.1"] = q_4_1_points

if (q_4_0_points + q_4_1_points == 5) {
    q_4_2_points = level_2_additional_question(answer: q_4_1)
}  else {
    q_4_2_points = 0
}

array_points["q4.2"] = q_4_2_points


//MARK: - Questions: 5.0 , 5.1, 5.2
/***************************************************************/

var q_5_0_points : Int
var q_5_1_points : Int
var q_5_2_points : Int
q_5_0_points  = level_2_main_question(points: array_points, answer: q_5_0, number: "q5.0")
array_points["q5.0"] = q_5_0_points

if q_5_0_points < 0 {
    q_5_1_points = level_2_additional_question(answer: q_5_1)
}  else {
    q_5_1_points = 0
}
array_points["q5.1"] = q_5_1_points

if (q_5_0_points + q_5_1_points == 5) {
    q_5_2_points = level_2_additional_question(answer: q_5_1)
}  else {
    q_5_2_points = 0
}
array_points["q5.2"] = q_5_2_points

//MARK: - Questions: 6.0 , 6.1, 6.2, 6.3
/***************************************************************/

var q_6_0_points : Int
var q_6_1_points : Int
var q_6_2_points : Int
var q_6_3_points : Int
q_6_0_points  = level_3_main_question(points: array_points, answer: q_6_0, number: "q6.0")
array_points["q6.0"] = q_6_0_points

if q_6_0_points < 0 {
    q_6_1_points = level_3_additional_question(answer: q_6_1)
}  else {
    q_6_1_points = 0
}
array_points["q6.1"] = q_6_1_points

if (q_6_0_points + q_6_1_points == 5) {
    q_6_2_points = level_3_additional_question(answer: q_6_2)
}  else {
    q_6_2_points = 0
}
array_points["q6.2"] = q_6_2_points

if (q_6_0_points + q_6_1_points + q_6_2_points == 30) {
    q_6_3_points = level_3_additional_question(answer: q_6_3)
}  else {
    q_6_3_points = 0
}
array_points["q6.3"] = q_6_3_points

//MARK: - Questions: 7.0 , 7.1, 7.2, 7.3
/***************************************************************/
 
var q_7_0_points : Int
var q_7_1_points : Int
var q_7_2_points : Int
var q_7_3_points : Int
q_7_0_points  = level_3_main_question(points: array_points, answer: q_7_0, number: "q7.0")
array_points["q7.0"] = q_7_0_points
 
if q_7_0_points < 0 {
    q_7_1_points = level_3_additional_question(answer: q_7_1)
}  else {
    q_7_1_points = 0
}
array_points["q7.1"] = q_7_1_points
 
if (q_7_0_points + q_7_1_points == 5) {
    q_7_2_points = level_3_additional_question(answer: q_7_2)
}  else {
    q_7_2_points = 0
}
array_points["q7.2"] = q_7_2_points
 
if (q_7_0_points + q_7_1_points + q_7_2_points == 30) {
    q_7_3_points = level_3_additional_question(answer: q_7_3)
}  else {
    q_7_3_points = 0
}
array_points["q7.3"] = q_7_3_points

//MARK: - Questions: 8.0 , 8.1, 8.2, 8.3
/***************************************************************/
 
var q_8_0_points : Int
var q_8_1_points : Int
var q_8_2_points : Int
var q_8_3_points : Int
q_8_0_points  = level_3_main_question(points: array_points, answer: q_8_0, number: "q8.0")
array_points["q8.0"] = q_8_0_points
 
if q_8_0_points < 0 {
    q_8_1_points = level_3_additional_question(answer: q_8_1)
}  else {
    q_8_1_points = 0
}
array_points["q8.1"] = q_8_1_points
 
if (q_8_0_points + q_8_1_points == 5) {
    q_8_2_points = level_3_additional_question(answer: q_8_2)
}  else {
    q_8_2_points = 0
}
array_points["q8.2"] = q_8_2_points
 
if (q_8_0_points + q_8_1_points + q_8_2_points == 30) {
    q_8_3_points = level_3_additional_question(answer: q_8_3)
}  else {
    q_8_3_points = 0
}
array_points["q8.3"] = q_8_3_points

//MARK: - Questions: 9.0 , 9.1, 9.2, 9.3
/***************************************************************/
 
var q_9_0_points : Int
var q_9_1_points : Int
var q_9_2_points : Int
var q_9_3_points : Int
q_9_0_points  = level_3_main_question(points: array_points, answer: q_9_0, number: "q9.0")
array_points["q9.0"] = q_9_0_points
 
if q_9_0_points < 0 {
    q_9_1_points = level_3_additional_question(answer: q_9_1)
}  else {
    q_9_1_points = 0
}
array_points["q9.1"] = q_9_1_points
 
if (q_9_0_points + q_9_1_points == 5) {
    q_9_2_points = level_3_additional_question(answer: q_9_2)
}  else {
    q_9_2_points = 0
}
array_points["q9.2"] = q_9_2_points
 
if (q_9_0_points + q_9_1_points + q_9_2_points == 30) {
    q_9_3_points = level_3_additional_question(answer: q_9_3)
}  else {
    q_9_3_points = 0
}
array_points["q9.3"] = q_9_3_points

//MARK: - Results
/***************************************************************/


print(array_points)

for i in array_points {
    print(i)
}

for (_,i) in array_points {
    print(i)
}




//
//  QuizBrain.swift
//  Thai-For-Beginer
//
//  Created by Waleerat Gottlieb on 2020-11-02.
//

import Foundation

struct QuizBrain {
    
    var questionNumber = 0
    var score = 0
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(kMaxQuiz)
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
    mutating func resetQuiz() {
        questionNumber = 0
        score = 0
    }
    
     mutating func quizCounter() { 
        questionNumber += 1
    }
    
    //func resetPassword(email: String, completion: @escaping (_ response: String) -> Void) {
    func getQuiz(numberOfRows: Int, completion: @escaping (_ choices : [Int], _ answer: Int) -> Void) {
        let random = randomUniqueNumber()
        let quizChoices = random.generateNumbers(repetitions: 4, maxValue: numberOfRows-1)
        let quizAnswer = quizChoices.randomElement()!
        completion(quizChoices, quizAnswer)
    }
}

// MARK: - Random Unique number
class randomUniqueNumber {

    var numbers: [Int] = []

    func generateNumbers(repetitions: Int, maxValue: Int) -> [Int] {
        guard maxValue >= repetitions else {
            fatalError("maxValue must be >= repetitions for the numbers to be unique")
        }

        numbers = []

        for _ in 1...repetitions {
            var n: Int
            repeat {
                n = random(maxValue: maxValue)
            } while numbers.contains(n)
            numbers.append(n)
        }

        return numbers
    }

    private func random(maxValue: Int) -> Int {
        return Int(arc4random_uniform(UInt32(maxValue + 1)))
    }

}

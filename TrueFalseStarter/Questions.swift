//
//  Questions.swift
//  TrueFalseStarter
//
//  Created by Ryan Clark on 26/02/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//
import GameKit
import Foundation

// Struct holding the basic format for each question
struct NewQuestions {
    var question: String
    var answerChoices: [String]
    var answer: String
}

// Struct holding each individual quaetion with answer choice and answers
struct QuizQuestions {
    var questions: [NewQuestions] = [
    NewQuestions(question: "Who won the FIFA world cup in 2014?", answerChoices: ["Spain", "Netherlands", "Argentina", "Germany"], answer: "Germany"),
    NewQuestions(question: "Who won the FIFA world cup in 2010?", answerChoices: ["Italy", "France", "Brazil", "Spain"], answer: "Spain"),
    NewQuestions(question: "Who won the FIFA world cup in 2006?", answerChoices: ["England", "Brazil", "Germany", "Italy"], answer: "Italy"),
    NewQuestions(question: "Who won the FIFA world cup in 2002?", answerChoices: ["Brazil", "Italy", "Spain", "Germany"], answer: "Brazil"),
    NewQuestions(question: "Who won the FIFA world cup in 1998?", answerChoices: ["Argentina", "France", "England", "Netherlands"], answer: "France"),
    NewQuestions(question: "Who was the top goal scorer in the 2014 FIFA world cup?", answerChoices: ["Thomas Mueller", "Wayne Rooney", "Lionel Messi", "James Rodriguez"], answer: "James Rodriguez"),
    NewQuestions(question: "Who was the top goal scorer in the 2010 FIFA world cup?", answerChoices: ["David Villa", "Thomas Mueller", "Wesley Sneijder", "Luis Suarez"], answer: "Thomas Mueller"),
    NewQuestions(question: "Who was the top goal scorer in the 2006 FIFA world cup?", answerChoices: ["Hernan Crespo", "Ronaldo", "Zinedine Zidane", "Miroslav Klose"], answer: "Miroslav Klose"),
    NewQuestions(question: "Who was the top goal scorer in the 2002 FIFA world cup?", answerChoices: ["Rivaldo", "Ronaldo", "Alan Shearer", "Zinedine Zidane"], answer: "Ronaldo"),
    NewQuestions(question: "Who was the top goal scorer in the 1998 FIFA world cup?", answerChoices: ["Luis Henandez", "Gabriel Batistuta", "Ramon Ramirez", "Davor Suker"], answer: "Davor Suker")
    ]

// Random selection form the array of questions
    func randomIndexOfSelectedQuestions() -> Int {
    let indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
    return indexOfSelectedQuestion
    }
    
// Pulls the question value
    func randomQuestion(indexOfSelectedQuestion: Int) -> String {
        let questionCollection = questions[indexOfSelectedQuestion]
        return questionCollection.question
    }
    
// Random answers on each of the provided buttons
    func randomAnswer(indexOfSelectedQuestion: Int) -> [String] {
        let questionCollection = questions[indexOfSelectedQuestion]
        return questionCollection.answerChoices
    }
    
// Function to return the correct answer
    func correctAnswerToQuestion(indexOfSelectedQuestion: Int) -> String {
        let questionCollection = questions[indexOfSelectedQuestion]
        return questionCollection.answer
    }
}

// Collection to hold the used questions so they aren't repeated
var answeredQuestions = [NewQuestions]()

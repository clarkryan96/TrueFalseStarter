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

struct QuestionProvider {
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

// Generating index from the question array
    func randomIndexOfSelectedQuestion() -> Int {
        let indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        return indexOfSelectedQuestion
    }
// Pulls the value from the question within NewQuestions
    func randomQuestion(indexOfSelectedQuestion: Int) -> String {
        let questionArray = questions[indexOfSelectedQuestion]
        return questionArray.question
    }
// Allows answers to appear on different buttons when displaying
    func randomAnswer(indexOfSelectedQuestion: Int) -> [String] {
        let questionArray = questions[indexOfSelectedQuestion]
        return questionArray.answerChoices
    }
// Returns the correct answer for the checkAnswer action to check against the button pressed by the user
    func getCorrectAnswerByQuestion(in index: Int) -> String {
        let questionArray = questions[index]
        return questionArray.answer
    }
}
// Collection that will hold the used question so they aren't repeated
var answeredQuestionIndexesCollection = [NewQuestions]()

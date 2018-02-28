//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    // Variables alrady provided 
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    var questionProvider = QuestionProvider()
    
    var gameSound: SystemSoundID = 0
    
    // All buttons and labels stored within main.storyboard connected
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    var correctAnswer = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        playGameStartSound()
        displayQuestions()
        displayAnswer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// Display a random question from the question array
    func displayQuestions() {
        indexOfSelectedQuestion = questionProvider.randomIndexOfSelectedQuestion()
        let question = questionProvider.randomQuestion(indexOfSelectedQuestion: indexOfSelectedQuestion)
        questionField.text = question
        playAgainButton.isHidden = true
    }
    
// Displays the answer choices for each question
    func displayAnswer() {
        let answerArray = questionProvider.randomAnswer(indexOfSelectedQuestion: indexOfSelectedQuestion)
        
        if answerArray.count == 4 {
            option1.setTitle(answerArray[0], for: .normal)
            option2.setTitle(answerArray[1], for: .normal)
            option3.setTitle(answerArray[2], for: .normal)
            option4.setTitle(answerArray[3], for: .normal)
        }
    }
    
// Shows the final score with a message
    func displayScore() {
        // Hides each answer button
        option1.isHidden = true
        option2.isHidden = true
        option3.isHidden = true
        option4.isHidden = true
        
        // Statement that will chnage depending on the score in the round
        if correctQuestions == 4 {
            questionField.text = "Looks like you know your Football! With a score of \(correctQuestions) out of \(questionsPerRound)."
        }   else {
            questionField.text = "Looks like we've still got a bit of work to do! You got \(correctQuestions) out of \(questionsPerRound)."
        }
        playAgainButton.isHidden = false
    }

// Action that will check the button pressed with the correct answer according to questionProvider Object
    @IBAction func checkAnswer(_ sender: UIButton) {
        questionsAsked += 1
        
        correctAnswer = questionProvider.getCorrectAnswerByQuestion(in: indexOfSelectedQuestion)
        
        if (sender == option1 && option1.titleLabel?.text == correctAnswer) || (sender == option2 && option2.titleLabel?.text == correctAnswer) || (sender == option3 && option3.titleLabel?.text == correctAnswer) || (sender == option4 && option4.titleLabel?.text == correctAnswer) {
            correctQuestions += 1
            questionField.text = "Correct!"
        }   else {
            questionField.text = "Sorry wrong answer!"
        }
        removeQuestionFromGame()
        loadNextRoundWithDelay(seconds: 2)
    }
 
// Function that provides the user to play another round
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestions()
            displayAnswer()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        option1.isHidden = false
        option2.isHidden = false
        option3.isHidden = false
        option4.isHidden = false
        
        resetQuestionsInGame()
        questionsAsked = 0
        correctQuestions = 0
        
        nextRound()
    }
    
// Function that stops any questions from repeating during a game
    func removeQuestionFromGame() {
        answeredQuestionIndexesCollection.append(questionProvider.questions[indexOfSelectedQuestion])
        questionProvider.questions.remove(at: indexOfSelectedQuestion)
    }
    
// Function that resets the list of possible questions during the round
    func resetQuestionsInGame() {
        questionProvider.questions.append(contentsOf: answeredQuestionIndexesCollection)
        answeredQuestionIndexesCollection.removeAll()
    }
    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}


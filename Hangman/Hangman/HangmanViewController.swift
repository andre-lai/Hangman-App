//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    //array of the characters in the word to guess
    var characters: Array<Character>?
    
    //list of incorrect guesses
    var incorrectList: Array<Character> = []
    
    //current letter
    var letter: Character?
    
    //current guessed word
    var word: Array<Character> = []
    
    //Letters already pressed
    var alreadyPressed: Array<Character> = []
    
    //image count
    var imageCount: Int = 1
    
    //win state
    var winState: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hangmanPhrases = HangmanPhrases()
        // Generate a random phrase for the user to guess
        let phrase: String = hangmanPhrases.getRandomPhrase()
        characters = Array(phrase.characters)
        print(phrase)
        for elem in characters! {
            if (elem != " ") {
                word += ["-"]
            } else {
                word += [" "]
            }
        }
        updateWordToGuess()
        updateImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //can use .range(of...) to check letter
    
    @IBOutlet weak var hangmanImage: UIImageView!
    func updateImage() {
        let image: String = "hangman" + String(imageCount)
        hangmanImage.image = UIImage(named: image)
        imageCount += 1

        if (incorrectList.count > 10) {
            let mes: String = "The Phrase Was:\n" + String(characters!) + "!\n\nPress New Game to play again!"
            let alert = UIAlertController(title: "You Lose!", message: mes, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            //to prevent additional input
            winState = true
        }
    }
    
    @IBOutlet weak var wordToGuess: UILabel!
    func updateWordToGuess() {
        if (letter != nil  && !alreadyPressed.contains(letter!) && !winState) {
            alreadyPressed += [letter!]
            for i in 0..<characters!.count {
                if (characters![i] == letter!) {
                        word[i] = letter!
                }
            }
            if !characters!.contains(letter!) {
                updateIncorrectGuessList(letter: letter!)
            }
        }
        
        wordToGuess.text = String(word)
        
        if (!word.contains("-") && !winState){
            //you win!
            let mes: String = "You Guessed the Phrase:\n" + String(characters!) + "!\n\nPress New Game to play again!"
            let alert = UIAlertController(title: "You Win!", message: mes, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            winState = true
        }
        
        //check letter
        //update incorrectGuesssList and image if necessary
    }
    
    @IBOutlet weak var incorrectGuessList: UILabel!
    func updateIncorrectGuessList(letter: Character) {
        incorrectList += [letter, " "]
        incorrectGuessList.text = String(incorrectList)
        updateImage()
    }
    
    @IBAction func userPressedNewGame(_ sender: UIButton) {
        startNewGame()
    }
    
    func startNewGame() {
        characters  = []
        incorrectList = []
        letter = nil
        word = []
        alreadyPressed = []
        imageCount = 1
        winState = false
        
        let hangmanPhrases = HangmanPhrases()
        let phrase: String = hangmanPhrases.getRandomPhrase()
        characters = Array(phrase.characters)
        for elem in characters! {
            if (elem != " ") {
                word += ["-"]
            } else {
                word += [" "]
            }
        }
        incorrectGuessList.text = ""
        updateWordToGuess()
        updateImage()
    }
    
    //Each letter button (A - Z)
    @IBAction func aButton(_ sender: UIButton) {
        letter = "A"
        //process letter by calling updateWord to Guess()
        updateWordToGuess()
    }
    
    @IBAction func bButton(_ sender: UIButton) {
        letter = "B"
        updateWordToGuess()
    }
    
    @IBAction func cButton(_ sender: UIButton) {
        letter = "C"
        updateWordToGuess()
    }
    
    @IBAction func dButton(_ sender: UIButton) {
        letter = "D"
        updateWordToGuess()
    }
    
    @IBAction func eButton(_ sender: UIButton) {
        letter = "E"
        updateWordToGuess()
    }
    
    @IBAction func fButton(_ sender: UIButton) {
        letter = "F"
        updateWordToGuess()
    }
    
    @IBAction func gButton(_ sender: UIButton) {
        letter = "G"
        updateWordToGuess()
    }
    
    @IBAction func hButton(_ sender: UIButton) {
        letter = "H"
        updateWordToGuess()
    }
    
    @IBAction func iButton(_ sender: UIButton) {
        letter = "I"
        updateWordToGuess()
    }
    
    @IBAction func jButton(_ sender: UIButton) {
        letter = "J"
        updateWordToGuess()
    }
    
    @IBAction func kButton(_ sender: UIButton) {
        letter = "K"
        updateWordToGuess()
    }
    
    @IBAction func lButton(_ sender: UIButton) {
        letter = "L"
        updateWordToGuess()
    }
    
    @IBAction func mButton(_ sender: UIButton) {
        letter = "M"
        updateWordToGuess()
    }
    
    @IBAction func nButton(_ sender: UIButton) {
        letter = "N"
        updateWordToGuess()
    }
    
    @IBAction func oButton(_ sender: UIButton) {
        letter = "O"
        updateWordToGuess()
    }
    
    @IBAction func pButton(_ sender: UIButton) {
        letter = "P"
        updateWordToGuess()
    }
    
    @IBAction func qButton(_ sender: UIButton) {
        letter = "Q"
        updateWordToGuess()
    }
    
    @IBAction func rButton(_ sender: UIButton) {
        letter = "R"
        updateWordToGuess()
    }
    
    @IBAction func sButton(_ sender: UIButton) {
        letter = "S"
        updateWordToGuess()
    }
    
    @IBAction func tButton(_ sender: UIButton) {
        letter = "T"
        updateWordToGuess()
    }
    
    @IBAction func uButton(_ sender: UIButton) {
        letter = "U"
        updateWordToGuess()
    }
    
    @IBAction func vButton(_ sender: UIButton) {
        letter = "V"
        updateWordToGuess()
    }
    
    @IBAction func wButton(_ sender: UIButton) {
        letter = "W"
        updateWordToGuess()
    }
    
    @IBAction func xButton(_ sender: UIButton) {
        letter = "X"
        updateWordToGuess()
    }
    
    @IBAction func yButton(_ sender: UIButton) {
        letter = "Y"
        updateWordToGuess()
    }
    
    @IBAction func zButton(_ sender: UIButton) {
        letter = "Z"
        updateWordToGuess()
    }
    
}

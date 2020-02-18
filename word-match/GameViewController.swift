//
//  GameViewController.swift
//  word-match
//
//  Created by Joh Robbins on 12/2/20.
//  Copyright © 2020 Joh Robbins. All rights reserved.
//

import UIKit

class GameViewController: UIViewController
{
    private var currentGame: Game!

    private var words = [
        "Apple", "Avocado", "Balloon", "Banana", "Bicycle", "Blueberry", "Butterfly", "Car",
        "Carrot", "Cherry", "Chicken", "Cow", "Dog", "Duck", "Grape", "House", "Leaf", "Lemon",
        "Orange", "Pear", "Pineapple", "Pumpkin", "Snowman", "Strawberry", "Sun", "Sunflower",
        "Tractor", "Train", "Tree", "Watermelon"
    ]

    @IBOutlet private var scoreLabel: UILabel!
    @IBOutlet private var wordLabel: UILabel!
    @IBOutlet private var tileStackView: UIStackView!
    @IBOutlet private var tiles: [UIButton]! {
        didSet { tiles.forEach { tile in tile.setRoundedShadowEffect() }}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newGame()
    }

    private func newGame() {
        currentGame = Game(listOfWords: words)
        scoreLabel.text = String(currentGame.score)
        newRound()
    }
    
    private func newRound() {
        guard currentGame.listOfWords.count > 0 else {
            performSegue(withIdentifier: "endGame", sender: self)
            AudioManager.playSoundEffect(sound: AudioEffects.GameComplete)
            return
        }

        words.shuffle()
        var picturesForTheRound = Array(words.prefix(tiles.count))
        let answerPicture = currentGame.getNewWord()
        if !picturesForTheRound.contains(answerPicture) {
            let replacePicture = Int.random(in: 0 ..< tiles.count)
            picturesForTheRound[replacePicture] = answerPicture
        }

        updateUI(picturesForTheRound)
    }

    private func updateUI(_ pictures: [String]) {
        wordLabel.text = currentGame.word

        for (i, tile) in tiles.enumerated() {
            setTilePictures(tile, pictures[i])
        }
    }

    private func setTilePictures(_ tile: UIButton, _ pictureName: String) {
        tile.setImage(UIImage(named: pictureName), for: .normal)
        tile.setImage(UIImage(named: pictureName), for: .highlighted)
        tile.setTitle(pictureName, for: .normal)
    }

    @IBAction func checkAnswer(_ sender: UIButton) {
        if sender.titleLabel?.text == currentGame.word {
            currentGame.score += 1
            sender.backgroundColor = UIColor(named: "TileCorrectAnswer")
            AudioManager.playSoundEffect(sound: AudioEffects.CorrectAnswer)
        } else {
            sender.backgroundColor = UIColor(named: "TileIncorrectAnswer")
            AudioManager.playSoundEffect(sound: AudioEffects.IncorrectAnswer)
        }

        scoreLabel.text = String(currentGame.score)

        // Pause for half a second before moving onto the next round
        tileStackView.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            sender.backgroundColor = UIColor(named: "Tile")
            self.tileStackView.isUserInteractionEnabled = true
            self.newRound()
        }
    }

    @IBAction func unwindToGame(unwindSegue: UIStoryboardSegue) {
        newGame()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "endGame" {
            if let gameOverViewController = segue.destination as? GameOverViewController {
                gameOverViewController.score = currentGame.score
            }
        }
    }
}

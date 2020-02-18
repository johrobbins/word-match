//
//  GameOverViewController.swift
//  word-match
//
//  Created by Joh Robbins on 16/2/20.
//  Copyright © 2020 Joh Robbins. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet private var highScoreAlertLabel: UILabel!
    @IBOutlet private var scoreLabel: UILabel!
    @IBOutlet private var highScoreLabel: UILabel!
    @IBOutlet private var scorePanel: UIView! {
       didSet { scorePanel.setRoundedShadowEffect() }
    }
    
    @IBOutlet private var retryButton: UIButton! {
       didSet { retryButton.setRoundedShadowEffect() }
   }

    public var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func retryButtonTapped(_ sender: UIButton) {
        AudioManager.playSoundEffect(sound: AudioEffects.ButtonTap)
    }

    private func updateUI() {
        var highScore = loadUserHighScore()

        if (score > highScore) {
            highScoreAlertLabel.isHidden = false
            highScore = score
            saveUserHighScore(newScore: score)
        }

        scoreLabel.text = String(score)
        highScoreLabel.text = String(highScore)
    }

    private func loadUserHighScore() -> Int {
        return UserDefaults.standard.integer(forKey: "HighScore")
    }

    private func saveUserHighScore(newScore: Int) {
        UserDefaults.standard.set(newScore, forKey: "HighScore")
    }
}

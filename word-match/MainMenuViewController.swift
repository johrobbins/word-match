//
//  ViewController.swift
//  word-match
//
//  Created by Joh Robbins on 6/2/20.
//  Copyright © 2020 Joh Robbins. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet private var startGameButton: UIButton! {
        didSet { startGameButton.setRoundedShadowEffect() }
    }

    @IBAction func startGame(_ sender: UIButton) {
        AudioManager.playSoundEffect(sound: AudioEffects.ButtonTap)
    }

    @IBAction func creditsButtonTapped(_ sender: Any) {
        AudioManager.playSoundEffect(sound: AudioEffects.ButtonTap)
    }

    @IBAction func unwindToMainMenu(unwindSegue: UIStoryboardSegue) {}
}


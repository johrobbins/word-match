//
//  CreditsViewController.swift
//  word-match
//
//  Created by Joh Robbins on 16/2/20.
//  Copyright © 2020 Joh Robbins. All rights reserved.
//

import UIKit

class CreditsViewController: UIViewController {

    @IBOutlet private var audioCreditsView: UIView! {
        didSet { audioCreditsView.setRoundedShadowEffect() }
    }

    @IBOutlet private var iconCreditsView: UIView! {
        didSet { iconCreditsView.setRoundedShadowEffect() }
    }

    @IBOutlet private var returnButton: UIButton! {
        didSet { returnButton.setRoundedShadowEffect() }
    }

    @IBAction func returnButtonTapped(_ sender: UIButton) {
        AudioManager.playSoundEffect(sound: AudioEffects.ButtonTap)
    }

}

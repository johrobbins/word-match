//
//  AudioManager.swift
//  word-match
//
//  Created by Joh Robbins on 16/2/20.
//  Copyright © 2020 Joh Robbins. All rights reserved.
//

import AVFoundation

enum AudioEffects: String {
    case IncorrectAnswer = "IncorrectAnswer.mp3"
    case CorrectAnswer = "CorrectAnswer.mp3"
    case GameComplete = "Fanfare.mp3"
    case ButtonTap = "ButtonTap.mp3"
}

class AudioManager
{
    private static var audioPlayer: AVAudioPlayer?

    public static func playSoundEffect(sound: AudioEffects) {
        let path = Bundle.main.path(forResource: sound.rawValue, ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            // couldn't load file :(
        }
    }
}

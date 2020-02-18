//
//  Game.swift
//  word-match
//
//  Created by Joh Robbins on 12/2/20.
//  Copyright © 2020 Joh Robbins. All rights reserved.
//

import Foundation

struct Game {
    var listOfWords: [String]
    var word: String
    var score: Int

    init(listOfWords: [String]) {
        self.listOfWords = listOfWords
        self.listOfWords.shuffle()
        word = self.listOfWords.last!
        score = 0
    }

    mutating func getNewWord() -> String {
        word = listOfWords.popLast()!
        return word
    }
}

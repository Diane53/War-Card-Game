//
//  Cards.swift
//  War! Card Game
//
//  Created by Diane R. Warde on 5/31/21.
//

import Foundation

struct Card: Identifiable, Decodable {
    
var id:UUID?
var name:String
var value:Int
}

// create starting card decks with card values
    var playerStartDeck = ["card 5", "card 33", "card 22", "card 37", "card 10", "card 45", "card 41", "card 2", "card 49", "card 29", "card 38", "card 42", "card 21", "card 50", "card 6", "card 13", "card 17", "card 25", "card 14", "card 26", "card 30", "card 46"]

    var challengerStartDeck = ["card 16", "card 4", "card 44", "card 24", "card 31", "card 23", "card 19", "card 39", "card 36", "card 15", "card 47", "card 32", "card 7", "card 35", "card 48", "card 11", "card 52", "card 3", "card 12", "card 20", "card 27", "card 28", "card 40", "card 43", "card 51", "card 8"]



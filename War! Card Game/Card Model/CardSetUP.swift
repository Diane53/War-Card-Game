//
//  CardSetUP.swift
//  War! Card Game
//
//  Created by Xcode Server on 6/3/21.
//

import Foundation

public class CardModel: ObservableObject, Identifiable {
    
    var playerStartDeck = ["card1", "card2", "card5", "card6", "card9", "card10", "card13", "card14", "card17", "card18", "card21", "card22", "card25", "card26", "card29", "card30", "card33", "card34", "card37", "card39", "card41", "card42", "card45", "card46", "card49", "card50"]

    var challengerStartDeck = ["card3", "card4", "card7", "card8", "card11", "card12", "card15", "card16", "card19", "card20",  "card23", "card24", "card27", "card 28", "card 31", "card 32", "card 35", "card 36", "card 39", "card 40", "card 43", "card 44", "card47", "card 48", "card 51", "card 52"]

    enum cards {
        case card1
        case card2
        case card3
        case card4
        case card5
        case card6
        case card7
        case card8
        case card9
        case card10
        case card11
        case card12
        case card13
        case card14
        case card15
        case card16
        case card17
        case card18
        case card19
        case card20
        case card21
        case card22
        case card23
        case card24
        case card25
        case card26
        case card27
        case card28
        case card29
        case card30
        case card31
        case card32
        case card33
        case card34
        case card35
        case card36
        case card37
        case card38
        case card39
        case card40
        case card41
        case card42
        case card43
        case card44
        case card45
        case card46
        case card47
        case card48
        case card49
        case card50
        case card51
        case card52
    }

        var card = 0
        
            switch card {
                case .card1:2
                case .card2:2
                case .card3:2
                case .card4:2
                case .card5:3
                case .card6:3
                case .card7:3
                case .card8:3
                case .card9:4
                case .card10:4
                case .card11:4
                case .card12:4
                case .card13:5
                case .card14:5
                case .card15:5
                case .card16:5
                case .card17:6
                case .card18:6
                case .card19:6
                case .card20:6
                case .card21:7
                case .card22:7
                case .card23:7
                case .card24:7
                case .card25:8
                case .card26:8
                case .card27:8
                case .card28:8
                case .card29:9
                case .card30:9
                case .card31:9
                case .card32:9
                case .card33:10
                case .card34:10
                case .card35:10
                case .card36:10
                case .card37:11
                case .card38:11
                case .card39:11
                case .card40:11
                case .card41:12
                case .card42:12
                case .card43:12
                case .card44:12
                case .card45:13
                case .card46:13
                case .card47:13
                case .card48:13
                case .card49:14
                case .card50:14
                case .card51:14
                case .card52:14
            }
}

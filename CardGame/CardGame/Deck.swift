//
//  Deck.swift
//  CardGame
//
//  Created by 조재흥 on 18. 12. 4..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct Deck : CardGameDeck {
    private var cards : [Card]
    
    init() {
        var cards = [Card]()
        let suits : [Suit] = Suit.allCases
        let ranks : [Rank] = Rank.allCases
        
        for suit in suits {
            for rank in ranks {
                cards.append(Card.init(suit: suit, rank: rank))
            }
        }
        
        self.cards = cards
    }
    
    func count() -> Int {
        return cards.count
    }
    
    mutating func shuffle() {
        self.cards = shuffle(cards: self.cards)
    }
    
    mutating func removeOne() -> Card? {
        return cards.popLast()
    }
    
    mutating func reset() {
        self.cards = Deck().cards
    }
    
    func shuffle(cards:[Card]) -> [Card] {
        var willSuffleCards = cards
        
        for index in 0..<willSuffleCards.count {
            willSuffleCards.swapAt(index, Int(arc4random()) % willSuffleCards.count)
        }
        
        return willSuffleCards
    }
}

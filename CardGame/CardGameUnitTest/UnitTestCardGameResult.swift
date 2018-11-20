//
//  UnitTestCardGameResult.swift
//  CardGameUnitTest
//
//  Created by 윤지영 on 20/11/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestCardGameResult: XCTestCase {

    func testCardGameMockNil_whenNumberOfPlayersIsLessThanOne() {
        XCTAssertThrowsError(try CardGameMock.init(gameMode: .fiveStud, numberOfPlayers: -2))
    }

    func testCardGameMockPickWinner_whoHasTheBestHands() {
        let highCard = [Card.init(suit: .clubs, rank: .A),
                          Card.init(suit: .clubs, rank: .six),
                          Card.init(suit: .clubs, rank: .ten),
                          Card.init(suit: .diamonds, rank: .nine),
                          Card.init(suit: .spades, rank: .Q),
                          Card.init(suit: .hearts, rank: .five),
                          Card.init(suit: .diamonds, rank: .four)]
        let threeOfAKind = [Card.init(suit: .clubs, rank: .four),
                           Card.init(suit: .spades, rank: .four),
                           Card.init(suit: .hearts, rank: .six),
                           Card.init(suit: .spades, rank: .J),
                           Card.init(suit: .hearts, rank: .Q),
                           Card.init(suit: .diamonds, rank: .four),
                           Card.init(suit: .spades, rank: .K)]
        let twoPair = [Card.init(suit: .hearts, rank: .nine),
                          Card.init(suit: .clubs, rank: .K),
                          Card.init(suit: .diamonds, rank: .K),
                          Card.init(suit: .diamonds, rank: .A),
                          Card.init(suit: .clubs, rank: .four),
                          Card.init(suit: .hearts, rank: .A),
                          Card.init(suit: .clubs, rank: .two)]
        let threeCardStacks = [highCard, threeOfAKind, twoPair]
        let cardGame = try! CardGameMock.init(gameMode: .sevenStud, numberOfPlayers: 3)
        for cardStack in threeCardStacks {
            cardGame.addPlayer(with: cardStack)
        }
        XCTAssertEqual(cardGame.pickWinnerIndex(), 1)
    }

    func testCardGameMockPickWinner_whenPlayersHaveSameHands() {
        let highCard = [Card.init(suit: .clubs, rank: .A),
                          Card.init(suit: .clubs, rank: .six),
                          Card.init(suit: .clubs, rank: .ten),
                          Card.init(suit: .diamonds, rank: .nine),
                          Card.init(suit: .spades, rank: .Q)]
        let onePairWithFour = [Card.init(suit: .clubs, rank: .four),
                          Card.init(suit: .spades, rank: .four),
                          Card.init(suit: .hearts, rank: .six),
                          Card.init(suit: .spades, rank: .J),
                          Card.init(suit: .hearts, rank: .Q)]
        let onePairWithK = [Card.init(suit: .hearts, rank: .nine),
                          Card.init(suit: .clubs, rank: .K),
                          Card.init(suit: .diamonds, rank: .K),
                          Card.init(suit: .diamonds, rank: .A),
                          Card.init(suit: .clubs, rank: .four)]
        let threeCardStacks = [highCard, onePairWithFour, onePairWithK]
        let cardGame = try! CardGameMock.init(gameMode: .fiveStud, numberOfPlayers: 3)
        for cardStack in threeCardStacks {
            cardGame.addPlayer(with: cardStack)
        }
        XCTAssertEqual(cardGame.pickWinnerIndex(), 2)
    }

}

class CardGameMock: CardGame {
    private var players: [GamePlayer] = []

    func addPlayer(with cards: [Card]) {
        let player = Player()
        for card in cards {
            player.take(card: card)
        }
        players.append(player)
    }

    func pickWinnerIndex() -> Int? {
        guard var winner = players.first else { return nil }
        var number = 0
        for index in players.indices {
            guard let bestHandOfWinner = winner.bestHand else { continue }
            guard let bestHandOfPlayer = players[index].bestHand else { continue }
            if bestHandOfWinner < bestHandOfPlayer {
                winner = players[index]
                number = index
            }
        }
        return number
    }

}
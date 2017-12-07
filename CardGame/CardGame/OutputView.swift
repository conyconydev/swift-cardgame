//
//  OutputView.swift
//  CardGame
//
//  Created by Mrlee on 2017. 12. 4..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    func resetMsg() {
        print("카드 전체를 초기화했습니다.")
    }
    
    func countOfDeck(_ deck: Deck) {
        print("총 \(deck.count())장의 카드가 있습니다.\n")
    }
    
    func countOfRestDeck(_ deck: Deck) {
        print("전체 \(deck.count())장의 카드를 섞었습니다.\n")
    }
    
    func showMeTheCard(_ card: Card?) {
        guard let isCard = card else {
            errorMsg(.zeroCard)
            return
        }
        print(isCard)
    }
    
    func showMeTheTable(_ table: Table) {
        for index in 0..<table.cardStacksOfTable.count {
            print("참가자\(index+1)#", terminator: "")
            print(table.cardStacksOfTable[index])
        }
    }
    
    func lookDealerCards(of cards: [Card]) {
        print("딜러 \(cards)\n")
    }

}

extension OutputView {
    func errorMsg(_ code: ErrorCode) {
        print("\(code.rawValue)")
    }
}

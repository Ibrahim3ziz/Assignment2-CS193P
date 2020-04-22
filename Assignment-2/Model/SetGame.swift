//
//  SetGame.swift
//  Assignment-2
//
//  Created by Ibrahim Abdul Aziz on 2/19/20.
//

import Foundation

class SetGame {
    var visibleCards = [Card]()
    var deckCards = [Card]()
    var selectedCards = [Card]()
    var score = 0

    init () {
        newGame()
    }
    
    
    func newGame () {
        score = 0
        visibleCards.removeAll()
        deckCards.removeAll()
        selectedCards.removeAll()
        generateThePossibleCombinationOfCards()
        addCard(numberOfCards: 12)
        print("Generated \(deckCards.count) cards and added them to deck")
        print("Added \(visibleCards.count) cards from deck to game")

    }
    
    
  
    
    
     private func generateThePossibleCombinationOfCards() {
        for color in Card.CardColor.allProperties {
            for symbol in Card.Symbol.allProperties {
                for number in Card.CardNumber.allProperties {
                    for shading in Card.Shading.allProperties {
                        let card = Card(cardSymbol: symbol, cardNumber: number, cardColor: color, cardShading: shading)
                        deckCards.append(card)
                    }
                }
            }
        }
    }
    
    
    
   private func drawCardInTheGround() {
        let drawnCard = deckCards.remove(at: deckCards.count.arc4random)
        visibleCards.append(drawnCard)
        
    }
    
    func addCard(numberOfCards: Int) {
        for _ in 0..<numberOfCards {
            drawCardInTheGround()
        }
    }
    
     func cardIsSelected(card: Card) -> Bool {
        return selectedCards.firstIndex(of: card) != nil
    }
    
    
    
     func isSet() -> Bool {
        
        if selectedCards.count != 3 {
                          return false
                      }
        
        if selectedCards[0].cardColor == selectedCards[1].cardColor {
            if selectedCards[0].cardColor != selectedCards[2].cardColor {
                return false
            }
        }
            else if selectedCards[1].cardColor == selectedCards[2].cardColor {
                return false
            }
            else if (selectedCards[0].cardColor == selectedCards[2].cardColor) {
                return false
            }
        
        if selectedCards[0].cardNumber == selectedCards[1].cardNumber {
            if selectedCards[0].cardNumber != selectedCards[2].cardNumber {
                return false
            }
        } else if selectedCards[1].cardNumber == selectedCards[2].cardNumber {
            return false
        } else if (selectedCards[0].cardNumber == selectedCards[2].cardNumber) {
            return false
        }
        
        if selectedCards[0].cardShading == selectedCards[1].cardShading {
            if selectedCards[0].cardShading != selectedCards[2].cardShading {
                return false
            }
        } else if selectedCards[1].cardShading == selectedCards[2].cardShading {
            return false
        } else if (selectedCards[0].cardShading == selectedCards[2].cardShading) {
            return false
        }
        
        if selectedCards[0].cardSymbol == selectedCards[1].cardSymbol {
            if selectedCards[0].cardSymbol != selectedCards[2].cardSymbol {
                return false
            }
        } else if selectedCards[1].cardSymbol == selectedCards[2].cardSymbol {
            return false
        } else if (selectedCards[0].cardSymbol == selectedCards[2].cardSymbol) {
            return false
        }
        
        return true
    }
    
    
     
   // Matching Card
    func select(card: Card) {
        if selectedCards.count == 3 && isSet() {
            selectedCards.forEach {
                if let indexOfSelectedCard = visibleCards.firstIndex(of: $0) {
                    visibleCards.remove(at: indexOfSelectedCard)
                    if deckCards.count > 0 {
                        let insertedCard = deckCards.remove(at: deckCards.count.arc4random)
                        visibleCards.insert(insertedCard, at: indexOfSelectedCard)
                    }
                }
            }
            selectedCards.removeAll()
            score += 3
        }
            
        else if selectedCards.count == 3 && !isSet() {
            selectedCards.removeAll()
            score -= 1
        }
        
        if let cardToSelect = selectedCards.firstIndex(of: card) {
            selectedCards.remove(at: cardToSelect)
        }
        else {
            selectedCards.append(card)
        }
    }
    

     func dealMoreThreeCards() {
        if visibleCards.count < 24 {
            addCard(numberOfCards: 3)
        }
      }
}
    


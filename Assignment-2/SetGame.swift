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
    var selectedcards = [Card]()
    var score = 0

    init () {
        newGame()
    }
    
    
    func newGame () {
        score = 0
        visibleCards.removeAll()
        deckCards.removeAll()
        selectedcards.removeAll()
        generateThePossibleCombinationOfCards()
        addCard(numberOfCards: 12)
        print("Generated \(deckCards.count) cards and added them to deck")
        print("Add \(visibleCards.count) cards from deck to game")

    }
    
    
  
    
    
     private func generateThePossibleCombinationOfCards() {
        for color in Card.CardColor.allProperties {
            for symbol in Card.Symbol.allProperties {
                for number in Card.Number.allProperties {
                    for shading in Card.Shading.allProperties {
                        let card = Card(symbol: symbol, number: number, cardColor: color, shading: shading)
                        deckCards.append(card)
                    }
                }
            }
        }
        
    }
    
   private func drawCard() {
    
        let selectedCard = deckCards.remove(at: deckCards.count.arc4random)
        visibleCards.append(selectedCard)
        
    }
    
    func addCard(numberOfCards: Int) {
        for _ in 0..<numberOfCards {
            drawCard()
        }
    }
    
     func cardIsSelected(card: Card) -> Bool {
        return selectedcards.firstIndex(of: card) != nil
    }
    
     func isSet() -> Bool {
        
        var isSameColor = false
        var isSameSymbol = false
        var isSameNumber = false
        var isSameShading = false
        
        if selectedcards.count != 3 {
            return false
        }
        
        if selectedcards[0].cardColor == selectedcards[1].cardColor && selectedcards[0].cardColor == selectedcards[2].cardColor {
            
                isSameColor = true
            }
                
        else if selectedcards[0].number == selectedcards[1].number && selectedcards[0].number == selectedcards[2].number {
                
                isSameNumber = true
            }
                
        else if selectedcards[0].symbol == selectedcards[1].symbol && selectedcards[0].symbol == selectedcards[2].symbol {
                           
                isSameSymbol = true
            }
        else if selectedcards[0].shading == selectedcards[1].shading && selectedcards[0].shading == selectedcards[2].shading {
            
                isSameShading = true
        }
            
        if isSameColor == false && isSameSymbol == true && isSameShading == true && isSameNumber == true {
            return true
        }
        
        else if isSameColor == true && isSameSymbol == true && isSameShading == false && isSameNumber == true {
                return true
            }
        
        else if isSameColor == false && isSameSymbol == false && isSameShading == true && isSameNumber == false {
            return true
        }
        
        else if isSameColor == false && isSameSymbol == false && isSameShading == false && isSameNumber == false {
            return true
        }
        
        return false
    
    }
    
    
     
    
    func select(card: Card) {
        if selectedcards.count == 3 && isSet() {
            selectedcards.forEach {
                if let indexOfSelectedCard = selectedcards.firstIndex(of: $0) {
                    visibleCards.remove(at: indexOfSelectedCard)
                    if deckCards.count > 0 {
                        let insertedCard = deckCards.remove(at: deckCards.count.arc4random)
                        visibleCards.insert(insertedCard, at: indexOfSelectedCard)
                    }
                }
            }
            selectedcards.removeAll()
            score += 3
        }
        else if selectedcards.count == 3 && !isSet() {
            selectedcards.removeAll()
            score -= 1
        }
        
        if let cardToSelect = selectedcards.firstIndex(of: card) {
            selectedcards.remove(at: cardToSelect)
        }
        else {
            selectedcards.append(card)
        }
    }
    

     func dealMoreThreeCards() {
        if visibleCards.count < 24 {
            addCard(numberOfCards: 3)
        }
      }
}
    


//
//  SetCard.swift
//  Assignment-2
//
//  Created by Ibrahim Abdul Aziz on 2/19/20.
//

import Foundation

struct Card: Equatable,CustomStringConvertible {
    var description: String { return "\(cardSymbol), \(cardNumber), \(cardColor), \(cardShading)"}
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.cardSymbol == rhs.cardSymbol &&
            lhs.cardColor == rhs.cardColor &&
            lhs.cardNumber == rhs.cardNumber &&
            lhs.cardShading == rhs.cardShading
    }
    
    
    let cardSymbol: Symbol
    let cardNumber: CardNumber
    let cardColor: CardColor
    let cardShading: Shading
    
    
    
    enum Symbol: String, CustomStringConvertible {
        var description: String {return rawValue}
      
        
        case square = "■"
        case triangle = "▲"
        case circle = "●"
        
        static let allProperties = [square, triangle, circle]
    }
    
    enum CardNumber: Int {
        
        case one = 1
        case two = 2
        case three = 3
        
        static let allProperties = [one, two, three]
    }
    
    enum CardColor {
        
        case green
        case red
        case blue
        
    static let allProperties = [green, red, blue]
        
    }
    
    enum Shading {
        
        case solid
        case open
        case striped
        
        static let allProperties = [solid, open, striped]
    }
    
     
    
}



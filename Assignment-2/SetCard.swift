//
//  SetCard.swift
//  Assignment-2
//
//  Created by Ibrahim Abdul Aziz on 2/19/20.
//

import Foundation
import UIKit

struct Card: Equatable,CustomStringConvertible {
    var description: String { return "\(symbol), \(number), \(cardColor), \(shading)"}
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.symbol == rhs.symbol &&
            lhs.cardColor == rhs.cardColor &&
            lhs.number == rhs.number &&
            lhs.shading == rhs.shading
    }
    
    
    let symbol: Symbol
    let number: Number
    let cardColor: CardColor
    let shading: Shading
    
    
    
    enum Symbol: String, CustomStringConvertible {
        var description: String {return rawValue}
      
        
        case square = "■"
        case triangle = "▲"
        case circle = "●"
        
        static let allProperties = [square, triangle, circle]
    }
    
    enum Number: Int {
        
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



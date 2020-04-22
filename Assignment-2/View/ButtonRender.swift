//
//  ButtonRender.swift
//  Assignment-2
//
//  Created by Ibrahim Abdul Aziz on 2/22/20.
//

import Foundation
import UIKit


class ButtonRender {
    
    private static func getSymbol(card: Card) -> String {
           switch card.cardSymbol {
           case .square:
               return "◼︎"
           case .circle:
               return "●"
           case .triangle:
               return "▲"
           }
       }
       
       
       private static func getButtonSymbol(card: Card,  symbol: String) -> String {
           switch card.cardNumber {
           case .one: return "\(symbol)"
           case .two: return "\(symbol) \(symbol)"
           case .three: return "\(symbol) \(symbol) \(symbol)"
           }
       }
       
       private static func getButtonColor(card: Card) -> UIColor {
           switch card.cardColor {
           case .green: return UIColor.green
           case.blue: return UIColor.blue
           case.red: return UIColor.red
           }
       }
       
       private static func getButtonAttributedTitle(card: Card, color: UIColor, title: String) -> NSAttributedString {
           var attributes: [NSAttributedString.Key: Any] = [:]
           
           switch card.cardShading {
           case .solid:
               attributes[.strokeWidth] = -1
               attributes[.foregroundColor] = color
           case .open:
               attributes[.strokeWidth] = 4
               attributes[.foregroundColor] = color
           case .striped:
               attributes[.strokeWidth] = -1
               attributes[.foregroundColor] = color.withAlphaComponent(0.15)
           }
           
           return NSAttributedString(string: title, attributes: attributes)
       }
       
       
        static func rendreCard(card: Card, button: UIButton, selectButton: Bool, isSet: Bool) {
           
           let buttonColor = getButtonColor(card: card)
           let buttonSymbol = getSymbol(card: card)
           let buttonTitle = getButtonSymbol(card: card, symbol: buttonSymbol)
           let attributedTitle = getButtonAttributedTitle(card: card, color: buttonColor, title: buttonTitle)
           button.setAttributedTitle(attributedTitle, for: UIControl.State.normal)
           
           if selectButton {
                   if isSet {
                       button.select(borderColor: #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1))
                   } else {
                       button.select()
                   }
               } else {
                   button.deselect()
               }
           }
    
    
}


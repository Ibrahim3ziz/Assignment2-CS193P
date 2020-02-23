//
//  ViewController.swift
//  Assignment-2
//
//  Created by Ibrahim Abdul Aziz on 2/18/20.
//

import UIKit

class ViewController: UIViewController {
    
    let game = SetGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game.newGame()
        mapSetToCard()
        updateViewFromModel()
    }
    
    @IBOutlet private var setCardsButton: [UIButton]!
    @IBOutlet weak var dealThreeCardsButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel! {
        didSet {
            scoreLabel.text = "Score: \(game.score)"
        }
    }
    
    
    @IBAction func seCardButtonTouched(_ sender: UIButton) {
        if let cardIndex = setCardsButton.firstIndex(of: sender) {
            if cardIndex < game.visibleCards.count {
                game.select(card: game.visibleCards[cardIndex])
            }
        }
        updateViewFromModel()
    }
    
    
    private func updateViewFromModel() {
        mapSetToCard()
        var cardButtonIndex = 0
        scoreLabel.text = "Score: \(game.score)"
        for card in game.visibleCards {
            let button = setCardsButton[cardButtonIndex]
            ButtonRender.rendreCard(card: card, button: button, selectButton: game.cardIsSelected(card: card), isSet: game.isSet())
            cardButtonIndex += 1

        }

        
    }
    
   func mapSetToCard() {
    for buttonIndex in setCardsButton.indices {
        let button = setCardsButton[buttonIndex]
        button.deselect()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        button.layer.cornerRadius = 15
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        button.setAttributedTitle(nil, for: UIControl.State.normal)
        }
    }
    
    
    @IBAction func newGameButtonTouched(_ sender: UIButton) {
        dealThreeCardsButton.isEnabled = true
        game.newGame()
        mapSetToCard()
        updateViewFromModel()
    }
    
    
    
    @IBAction func dealThreCardsButtonTouched(_ sender: UIButton) {
        game.addCard(numberOfCards: 3)
        updateViewFromModel()
         if game.visibleCards.count >= 24 {
            dealThreeCardsButton.isEnabled = false
        }
    }
    
    
    
    
    
    
}


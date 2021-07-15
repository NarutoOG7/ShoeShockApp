//
//  SectionHeaderView.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 6/24/21.
//

import UIKit


protocol SectionHeaderViewDelegate {
    func reloadCVDataWithSportIndex(_ title: String)
}
class SectionHeaderView: UICollectionReusableView {
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var bballButton: UIButton!
    
    
    @IBOutlet weak var soccerButton: UIButton!
    @IBOutlet weak var comfortButton: UIButton!
    var delegate: SectionHeaderViewDelegate?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        delegate = nil
    }
    
    func updateUI() {
        stackView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        stackView.spacing = 30
        bballButton.layer.cornerRadius = 20
        soccerButton.layer.cornerRadius = 20
        comfortButton.layer.cornerRadius = 20
    }
    
    func manageButtons(senderButton: UIButton) {
        guard let buttonOne = bballButton, let buttonTwo = soccerButton, let buttonThree = comfortButton else { return }
        let buttons = [buttonOne, buttonTwo, buttonThree]
        for button in buttons {
            if button == senderButton {
                button.isSelected = true
                button.backgroundColor = #colorLiteral(red: 1, green: 0.7536035951, blue: 0.6726864442, alpha: 1)
            } else {
                button.isSelected = false
                button.backgroundColor = #colorLiteral(red: 0.926725911, green: 0.9644670051, blue: 0.8870801265, alpha: 1)
            }
        }
    }
    
    @IBAction func allTapped(_ sender: UIButton) {
        manageButtons(senderButton: sender)
        delegate?.reloadCVDataWithSportIndex(sender.titleLabel?.text ?? "Basketball")
    }
    
}

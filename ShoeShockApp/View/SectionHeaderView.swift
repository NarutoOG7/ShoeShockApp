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
    @IBOutlet weak var bballBackground: UIView!
    
    
    @IBOutlet weak var soccerButton: UIButton!
    @IBOutlet weak var soccerBackground: UIView!
    @IBOutlet weak var comfortButton: UIButton!
    @IBOutlet weak var comfortBackground: UIView!
    var delegate: SectionHeaderViewDelegate?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        delegate = nil
    }
    
    func updateUI() {
        stackView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        stackView.spacing = 30
        bballButton.layer.cornerRadius = 20
        bballBackground.layer.cornerRadius = 20
        soccerButton.layer.cornerRadius = 20
        soccerBackground.layer.cornerRadius = 20
        comfortButton.layer.cornerRadius = 20
        comfortBackground.layer.cornerRadius = 20
    }
    
    func manageButtons(senderButton: UIButton) {
        guard
            let bballButton = bballButton,
            let soccerButton = soccerButton,
            let comfortButton = comfortButton
                else { return }
        guard
            let bballBackground = bballBackground,
            let soccerBackground = soccerBackground,
            let comfortBackground = comfortBackground
                else { return }
        let buttons = [bballButton: bballBackground, soccerButton: soccerBackground, comfortButton: comfortBackground]
        for (button, background)in buttons {
            if button == senderButton {
                button.isSelected = true
                background.backgroundColor = #colorLiteral(red: 0.1360040118, green: 0.1373505862, blue: 0.1373505862, alpha: 1)
            } else {
                button.isSelected = false
                background.backgroundColor = #colorLiteral(red: 0.9685255885, green: 0.9686878324, blue: 0.9685028195, alpha: 1)
            }
        }
    }
    
    @IBAction func allTapped(_ sender: UIButton) {
        manageButtons(senderButton: sender)
        delegate?.reloadCVDataWithSportIndex(sender.titleLabel?.text ?? "Basketball")
    }
    
}

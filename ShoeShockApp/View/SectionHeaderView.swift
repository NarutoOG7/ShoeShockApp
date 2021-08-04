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
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var featuredButton: UIButton!
    @IBOutlet weak var upcomingButton: UIButton!

    var delegate: SectionHeaderViewDelegate?

    override func prepareForReuse() {
        super.prepareForReuse()
        
        delegate = nil
    }
    
    func updateUI() {
        stackView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        stackView.spacing = 60
        newButton.layer.cornerRadius = 20
        featuredButton.layer.cornerRadius = 20
        upcomingButton.layer.cornerRadius = 20
    }

    func manageButtons(senderButton: UIButton) {
        guard
            let newButton = newButton,
            let featuredButton = featuredButton,
            let upcomingButton = upcomingButton
        else { return }
        let buttons = [newButton, featuredButton, upcomingButton]
        for (button) in buttons {
            if button == senderButton {
                button.isSelected = true
            } else {
                button.isSelected = false
            }
        }
    }
    

    @IBAction func allTapped(_ sender: UIButton) {
        manageButtons(senderButton: sender)
        delegate?.reloadCVDataWithSportIndex(sender.titleLabel?.text ?? "Featured")
    }

}

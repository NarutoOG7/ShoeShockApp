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
    
//    @IBAction func tappedButton(_ sender: UIButton) {
//        sender.isSelected.toggle()
//        delegate?.reloadCVDataWithSportIndex(sender.tag)
//    }
    
    func updateColor(ofButton button: UIButton) {
        if button.isSelected {
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        } else {
            button.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        }
    }
    
    @IBAction func allTapped(_ sender: UIButton) {
        updateColor(ofButton: sender)
        sender.isSelected.toggle()
        delegate?.reloadCVDataWithSportIndex(sender.titleLabel?.text ?? "Basketball")
    }
    
//    @IBAction func bballTapped(_ sender: UIButton) {
//        updateColor(ofButton: sender)
//        sender.isSelected.toggle()
//
//    }
//    @IBAction func soccerTapped(_ sender: UIButton) {
//        updateColor(ofButton: sender)
//        sender.isSelected.toggle()
//    }
//    @IBAction func comfortTapped(_ sender: UIButton) {
//        updateColor(ofButton: sender)
//        sender.isSelected.toggle()
//    }
}

//
//  SectionHeaderView.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 6/24/21.
//

import UIKit

protocol SectionHeaderViewDelegate {
    func reloadCVDataWithSportIndex(_ index: Int)
}

class SectionHeaderView: UICollectionReusableView {

    var delegate: SectionHeaderViewDelegate?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        delegate = nil
    }
    
    
    @IBAction func tappedButton(_ sender: UIButton) {
        delegate?.reloadCVDataWithSportIndex(sender.tag)
    }
}

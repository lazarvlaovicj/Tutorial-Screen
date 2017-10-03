//
//  CustomButton.swift
//  CollectionViewTutorial
//
//  Created by Lazar Vlaovic on 10/3/17.
//  Copyright © 2017 Lazar Vlaovic. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override func awakeFromNib() {
        setupView()
    }
    
    //MARK: - UI
    func setupView() {
        layer.cornerRadius = bounds.height / 2
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.white.cgColor
    }

}

//
//  UIView+Extension.swift
//  word-match
//
//  Created by Joh Robbins on 17/2/20.
//  Copyright © 2020 Joh Robbins. All rights reserved.
//

import UIKit

extension UIView {
    func setRoundedShadowEffect() {
        self.layer.cornerRadius = 10
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 3.0
    }
}

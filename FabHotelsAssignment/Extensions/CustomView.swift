//
//  CustomView.swift
//  FabHotelsAssignment
//
//  Created by Shivi Agarwal on 19/11/21.
//


import Foundation
import UIKit

class CustomView: UIView
{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRadiusAndShadow()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setRadiusAndShadow()
    }
    
    func setRadiusAndShadow()
    {
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 5
    }
    
}


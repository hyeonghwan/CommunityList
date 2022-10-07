//
//  CategoryRoundedButton.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/06.
//

import Foundation
import UIKit


final class CategoryRoundedButton: UIButton{
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray4
        self.setImage(UIImage(systemName: "xmark.app"), for: .normal)
        self.layer.cornerRadius = 30
        self.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        self.titleLabel?.textColor = .label
        self.addTarget(self, action: #selector(categorybuttonTapped), for: .touchUpInside)
    }
    @objc func categorybuttonTapped(_ sender: UIButton){
        let vibrate = UIImpactFeedbackGenerator(style: .light)
        vibrate.impactOccurred()
    }
    required init?(coder: NSCoder) {
        fatalError("required init fatal error!")
    }
    
}


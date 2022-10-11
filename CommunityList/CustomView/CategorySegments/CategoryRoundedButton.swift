//
//  CategoryRoundedButton.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/06.
//

import Foundation
import UIKit


final class CategoryRoundedButton: UIButton{
    
    
    override var isSelected: Bool {
        didSet{
            isSelected ? selectedConfigure() : baseConfigure()
        }
    }
    var buttonRequestType: RequestType?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        self.addTarget(self, action: #selector(categorybuttonTapped), for: .touchUpInside)
    }
    convenience init(frame: CGRect,requestType: RequestType) {
        self.init(frame: frame)
        self.buttonRequestType = requestType
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init fatal error!")
    }
    
    func getButtonType() -> RequestType{
        if self.buttonRequestType != nil {
            return self.buttonRequestType!
        }
        debugPrint("getButtonTypeError occur!")
        return RequestType.all
    }
    
    
    
}
extension CategoryRoundedButton{
    
    func configure() {
        self.setImage(UIImage(systemName: "xmark.app"), for: .normal)
        self.backgroundColor = .systemGray4
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 30
        self.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        self.titleLabel?.textColor = .label
        
    }
    
    @objc func categorybuttonTapped(_ sender: UIButton){
        let vibrate = UIImpactFeedbackGenerator(style: .light)
        vibrate.impactOccurred()
    }
    
    func baseConfigure() {
        self.layer.borderWidth = 0
    }
    
    func selectedConfigure() {
        self.layer.borderWidth = 5
    }
}


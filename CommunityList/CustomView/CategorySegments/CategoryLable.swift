//
//  CategoryLable.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/06.
//

import Foundation
import UIKit

final class CategoryLabel: UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = UIFont.boldSystemFont(ofSize: 14)
        self.textColor = .label
    }
    convenience init(frame: CGRect, name: String) {
        self.init(frame: frame)
        self.text = name
    }
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
}

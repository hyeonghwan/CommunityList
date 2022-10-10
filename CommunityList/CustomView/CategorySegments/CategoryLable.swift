//
//  CategoryLable.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/06.
//

import Foundation
import UIKit

final class CategoryLabel: UILabel{
    
    
    var buttonfocused: Bool = false {
        didSet{
            self.font = buttonfocused ? UIFont.systemFont(ofSize: 14, weight: .bold) : UIFont.systemFont(ofSize: 14,
                                                                                                           weight: .medium)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        self.textColor = .label
    }
    convenience init(frame: CGRect, requestType: RequestType) {
        self.init(frame: frame)
        self.text = requestType.rawValue
    }
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
    }
}

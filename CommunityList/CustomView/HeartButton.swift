//
//  HeartButton.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/08.
//

import Foundation
import UIKit

class HeartButton: UIButton {
    
    var isSelect: Bool = false{
        didSet{
            isSelect == true ?
            self.setBackgroundImage(UIImage(named: "heart.fill"), for: .normal)
            :
            self.setBackgroundImage(UIImage(named: "heart"), for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFit
        self.setBackgroundImage(UIImage(named: "heart"), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
}

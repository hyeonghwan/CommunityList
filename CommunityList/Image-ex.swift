//
//  Image-ex.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/12.
//

import Foundation
import UIKit


extension UIImageView{
    
    var findtoChangeLabelIndex: Int {
        
        guard var string = self.image?.description.components(separatedBy: " ")[2] else { return 0 }
        string.removeLast()
        let index = Int(String(string.removeLast())) ?? 0
        
        return index
    }
}

//
//  Array-Custom-Ex.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/06.
//

import Foundation
import UIKit


protocol IdentifiableProtocol{
    static var identify: String { get }
}
extension IdentifiableProtocol{
    static var identify : String {
        return String(describing: Self.self)
    }
}

extension TableViewCell: IdentifiableProtocol {}
extension HorizonTalTableSectionCell: IdentifiableProtocol {}


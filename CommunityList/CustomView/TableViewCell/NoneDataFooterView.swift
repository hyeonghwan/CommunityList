//
//  NoneCell.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/12.
//

import Foundation
import UIKit
import SnapKit

class NoneDataFooterView: UITableViewHeaderFooterView {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .label
        label.text = "더 가져올 정보가 없어요.."
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(label)
        label.snp.makeConstraints{
            $0.centerY.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    
}

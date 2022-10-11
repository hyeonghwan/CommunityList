//
//  HorizontalCollectionHeaderView.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/12.
//

import Foundation
import UIKit
import SnapKit

class HorizontalCollectionHeaderView: UIView{
    
    private lazy var collectionTitle: UILabel = {
        let label = UILabel()
        label.text = "지금 가장 뜨거운 빡코빡코 추천🔥"
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.contentMode = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(collectionTitle)
        
        collectionTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16)
            $0.top.trailing.bottom.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    
}

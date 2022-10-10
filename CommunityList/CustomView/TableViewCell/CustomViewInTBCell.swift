//
//  CustomViewInTBCell.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/10.
//

import Foundation


class CustomViewInTBCell: UIView{
    
    private lazy var headerTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    private lazy var contentLable: UILabel = {
        let label = UILabel()
        
        return label
    }()
    private lazy var tagLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    private lazy var label: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    
}

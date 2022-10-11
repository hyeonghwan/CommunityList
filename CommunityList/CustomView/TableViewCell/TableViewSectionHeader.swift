//
//  TableViewSectionHeader.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/07.
//

import Foundation
import UIKit
import SnapKit


class TableViewSectionHeader: UIView {
    
    lazy var searchBar: UISearchBar = {
       let bar = UISearchBar()
        bar.backgroundColor = .tertiarySystemBackground
        bar.placeholder = "키워드와 #태그 모두 검색할 수 있어요"
        bar.backgroundImage = UIImage()
        return bar
    }()
    
    lazy var categorySegemts: CategorySegmentControl = {
       let segment = CategorySegmentControl()
        return segment
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    
    func configure() {
        
        [searchBar,categorySegemts].forEach{
            self.addSubview($0)
        }
        
        searchBar.snp.makeConstraints{
            $0.top.equalTo(self.snp.top)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        categorySegemts.snp.makeConstraints{
            $0.top.equalTo(searchBar.snp.bottom).offset(16)
            $0.height.equalTo(95)
            $0.leading.trailing.equalToSuperview()
//            $0.bottom.equalToSuperview()
        }
        
    }
    
}

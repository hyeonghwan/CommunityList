//
//  CategorySegementControl.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/06.
//

import Foundation
import UIKit

class CategorySegmentControl: UIView{
    
    private lazy var containerView: CategoryCombineWithLabelContainerView = {
      let containerView = CategoryCombineWithLabelContainerView()
        return containerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configue()
    }
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    
    
    private func configue() {
        self.addSubview(containerView)
        
        containerView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(5)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview()
        }
        
        
        
    }
    
    
    
}

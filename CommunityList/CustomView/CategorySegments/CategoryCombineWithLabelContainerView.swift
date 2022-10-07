//
//  CategoryCombineWithLabel.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/06.
//

import Foundation
import UIKit
import SnapKit


struct CategoryButtonAndLabel {
    let categoryButton: CategoryRoundedButton
    let categoryLabel: CategoryLabel
}

class CategoryCombineWithLabelContainerView: UIView{
    
    let categories: [String] = ["전체", "문의", "가격","전문가검색", "의뢰하기", "기타문의","전체", "문의", "가격","전문가검색", "의뢰하기", "기타문의"]
    
    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var hStackViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var categoryButtonItems: [CategoryButtonAndLabel] = {
        let frame: CGRect = .zero
    
        var items: [CategoryButtonAndLabel] = []
        
        categories.forEach{ name in
            items.append(CategoryButtonAndLabel(categoryButton: CategoryRoundedButton(frame: .zero), categoryLabel: CategoryLabel(frame: .zero, name: name)))
        }
        
        return items
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.hStackViewContainer.sizeToFit()
        for item in categoryButtonItems{
            item.categoryButton.sizeToFit()
        }
    }
    
    func configure() {
        self.addSubview(scrollView)
        
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        scrollView.addSubview(hStackViewContainer)
        
        
        hStackViewContainer.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        for item in categoryButtonItems{
            
            let verticalStackView = UIStackView()
            
            verticalStackView.axis = .vertical
            verticalStackView.spacing = 10
            verticalStackView.alignment = .center
            verticalStackView.distribution = .equalSpacing
            
            hStackViewContainer.addArrangedSubview(verticalStackView)
            [item.categoryButton,item.categoryLabel].forEach{
                verticalStackView.addArrangedSubview($0)
            }
            item.categoryButton.snp.makeConstraints{
                $0.width.height.equalTo(60)
            }
            
        }
        
    }
    
    
}

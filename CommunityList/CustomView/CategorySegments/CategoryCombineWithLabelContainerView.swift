//
//  CategoryCombineWithLabel.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/06.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

struct CategoryButtonAndLabel {
    let categoryButton: CategoryRoundedButton
    let categoryLabel: CategoryLabel
}

class CategoryCombineWithLabelContainerView: UIView{
    
    let categories: [RequestType] = [ .ask, .price, .expertSearching, .request , .etc]
    
    var onChangeRequestType: (RequestType) -> ()
    
    let onChanged: Observable<RequestType>
    
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
    
        let firstButton = CategoryRoundedButton(frame: .zero, requestType: .all)
        
        firstButton.isSelected = true
        
        firstButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        let firstLabel = CategoryLabel(frame: .zero, requestType: .all)
        
        firstLabel.buttonfocused = true
        
        var items: [CategoryButtonAndLabel] = [CategoryButtonAndLabel(categoryButton: firstButton,
                                                                      categoryLabel: firstLabel)]
        
        categories.forEach{ requestType in
            let button = CategoryRoundedButton(frame: .zero, requestType: requestType)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            items.append(CategoryButtonAndLabel(categoryButton: button,
                                                categoryLabel: CategoryLabel(frame: .zero, requestType: requestType)))
        }
        
        return items
    }()
    
    @objc func buttonTapped(_ sender: CategoryRoundedButton){
        print("tapped")
        if sender.isSelected == false {
            categoryButtonItems
                .forEach{data in
                data.categoryButton.isSelected = false
                data.categoryLabel.buttonfocused = false
            }
            sender.isSelected = true
            onChangeRequestType(sender.getButtonType())
        }
        
    }
    
    override init(frame: CGRect) {
        
        let changingType = PublishSubject<RequestType>()
        
        onChangeRequestType = {type in changingType.onNext(type)  }
        
        onChanged = changingType
        
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

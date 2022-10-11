//
//  HorizontalCollectionViewCell.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/08.
//

import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift

class HorizontalCollectionViewCell: UICollectionViewCell {
    
    private lazy var requestNameType: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.425, green: 0.391, blue: 0.391, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var requestContent: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.169, green: 0.169, blue: 0.169, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .topLeft
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var actionHCView: ActionHCView = {
        let view = ActionHCView(frame: .zero)
        return view
    }()
    
    var onCollectionData: AnyObserver<MultipleSectionModel>
    
    var disposeBag = DisposeBag()
    
    override func layoutSubviews() {
        requestContent.sizeToFit()
    }
    
    override init(frame: CGRect) {
        
        
        let subject = PublishSubject<MultipleSectionModel>()
        
        onCollectionData = subject.asObserver()
        
        super.init(frame: frame)
        
        layoutconfigure()

        subject
            .observe(on: MainScheduler.instance)
            .bind(onNext: { [weak self] model in
                
                guard let self = self else { return }
                
                switch model{
                    
                case let .collectionItem(data):
                    
                    self.requestNameType.text = data.communityData.headerTitleType.rawValue
                    self.requestContent.text = data.communityData.content
                    self.actionHCView.updateUI(heartCount: data.communityData.heartCount,
                                               commentCount: data.communityData.commentCount)
                    
                default:
                    break
                }
            })
            .disposed(by: disposeBag)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    
}

extension HorizontalCollectionViewCell{
    private func layoutconfigure() {
        
        
        self.contentView.backgroundColor = UIColor(red: 0.967, green: 0.967, blue: 0.967, alpha: 1)
        
        self.contentView.layer.cornerRadius = 14
        
        [requestNameType,requestContent,actionHCView].forEach{
            self.contentView.addSubview($0)
        }
        
        requestNameType.snp.makeConstraints{
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.greaterThanOrEqualToSuperview()
        }
        self.requestNameType.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        requestContent.snp.makeConstraints{
            $0.top.equalTo(requestNameType.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        self.actionHCView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        actionHCView.snp.makeConstraints{
            // check
            $0.height.equalTo(25)
//            $0.top.greaterThanOrEqualTo(requestContent.snp.bottom).offset(16)
            $0.top.equalTo(requestContent.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.greaterThanOrEqualToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(20)
        }
        
    }
}

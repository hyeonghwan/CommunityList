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
    
    private var heart: Bool? {
        didSet{
            heartButton.isSelect = self.heart!
        }
    }
    
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
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var heartButton: HeartButton = {
        let button = HeartButton()
        self.heart == true ?
        button.setBackgroundImage(UIImage(named: "heart.fill"), for: .normal)
        :
        button.setBackgroundImage(UIImage(named: "heart"), for: .normal)
        return button
    }()
    
    private lazy var heartCount: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.779, green: 0.779, blue: 0.779, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFill
        button.setBackgroundImage(UIImage(named: "buble"), for: .normal)
        return button
    }()
    
    private lazy var commentCount: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.779, green: 0.779, blue: 0.779, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    var onCollectionData: AnyObserver<CommuityDataModel>
    
    var disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        
        let subject = PublishSubject<CommuityDataModel>()
        
        onCollectionData = subject.asObserver()
        
        super.init(frame: frame)
        
        layoutconfigure()
        
        subject
            .observe(on: MainScheduler.instance)
            .bind(onNext: { [weak self] communityModel in
                guard let self = self else { return }
                self.requestNameType.text = communityModel.titleType
                self.requestContent.text = communityModel.content
                self.heartCount.text = communityModel.heartCount
                self.commentCount.text = communityModel.commentCount
            })
            .disposed(by: disposeBag)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
}

extension HorizontalCollectionViewCell{
    private func layoutconfigure() {
        
        self.contentView.layer.backgroundColor = UIColor(red: 0.967, green: 0.967, blue: 0.967, alpha: 1).cgColor
        
        self.contentView.layer.cornerRadius = 14
        
        [requestNameType,requestContent,heartButton,heartCount,commentButton,commentCount].forEach{
            self.contentView.addSubview($0)
        }
        
        requestNameType.snp.makeConstraints{
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(16)
        }
        
        requestContent.snp.makeConstraints{
            $0.top.equalTo(requestNameType.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        heartButton.snp.makeConstraints{
            $0.top.equalTo(requestContent.snp.bottom).offset(18)
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(15)
        }
        
        heartCount.snp.makeConstraints{
            $0.leading.equalTo(heartButton.snp.trailing).offset(6)
            $0.top.equalTo(heartButton.snp.top)
        }
        
        commentButton.snp.makeConstraints{
            $0.width.height.equalTo(15)
            $0.top.equalTo(requestContent.snp.bottom).offset(18)
            $0.leading.equalTo(heartCount.snp.trailing).offset(15)
        }
        
        commentCount.snp.makeConstraints{
            $0.leading.equalTo(commentButton.snp.trailing).offset(6)
            $0.top.equalTo(commentButton.snp.top)
        }
    }
}

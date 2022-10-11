//
//  ActionHCView.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/10.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ActionHCView: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var heartButton: HeartButton = {
        let button = HeartButton()
        button.addTarget(self, action: #selector(tapped(_:)), for: .touchUpInside)
        return button
    }()
    
    @objc func tapped( _ sender: UIButton ){
        self.heartButton.isSelect.toggle()
        let vibrate = UIImpactFeedbackGenerator(style: .light)
        vibrate.impactOccurred()
    }
    
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
    
    
    var observer: AnyObserver<CommunityContainer>
    
    let disposeBag = DisposeBag()
    
    
    override init(frame: CGRect) {
        
        let transferData = PublishSubject<CommunityContainer>()
        
        observer = transferData.asObserver()
        
        super.init(frame: frame)
    
        transferData
            .map{data in data.heartCount}
            .bind(to: heartCount.rx.text)
            .disposed(by: disposeBag)
        
        transferData
            .map{data in data.commentCount}
            .bind(to: commentCount.rx.text)
            .disposed(by: disposeBag)
        
        configue()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    
    func updateUI( heartCount: String, commentCount: String){
        self.heartCount.text = heartCount
        self.commentCount.text = commentCount
    }
    
    func configue() {

        [containerView].forEach{
            self.addSubview($0)
        }
        containerView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        [heartButton,heartCount,commentButton,commentCount].forEach{
            self.containerView.addSubview($0)
        }

        heartButton.snp.makeConstraints{
            $0.width.height.equalTo(20)
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        heartCount.snp.makeConstraints{
            $0.leading.equalTo(heartButton.snp.trailing).offset(6)
            $0.top.equalToSuperview()
        }
        
        commentButton.snp.makeConstraints{
            $0.width.height.equalTo(20)
            $0.top.equalToSuperview()
            $0.leading.equalTo(heartCount.snp.trailing).offset(15)
        }
        
        commentCount.snp.makeConstraints{
            $0.leading.equalTo(commentButton.snp.trailing).offset(6)
            $0.top.equalToSuperview()
        }
    }
    
}

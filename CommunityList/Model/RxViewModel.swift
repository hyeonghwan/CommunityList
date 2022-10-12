//
//  RxViewModel.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/06.
//

import Foundation
import RxSwift
import RxDataSources
import RxCocoa

protocol RxViewModelType {
    
    var fetchRecommendCollectionData: AnyObserver<RequestType> { get }
    var fetchTableData: AnyObserver<RequestType> { get }
    
    var recommendCollectionViewContents: Observable<[RxDataSection]> { get }
    var tableViewContents: Observable<[RxDataSection]> { get }
    
}


final class RxViewModel: RxViewModelType{
    
    let disposeBag = DisposeBag()
    
    
    var fetchRecommendCollectionData: AnyObserver<RequestType>

    var recommendCollectionViewContents: Observable<[RxDataSection]>

    
    var fetchTableData: AnyObserver<RequestType>
    
    var tableViewContents: Observable<[RxDataSection]>
    
    
    init(_ domain: DataStoreSendType = DataStoreFetable()){
        
        let fetchingRecommend = PublishSubject<RequestType>()
        
        let communityRecommendContents = BehaviorSubject<[RxDataSection]>(value: [])
        
        // collectionView Recommend Setting
        fetchRecommendCollectionData = fetchingRecommend.asObserver()
        
        fetchingRecommend
            .flatMap(domain.collectionFetch)
            .map{rxRecommendData in
                return [RxDataSection(model: "firstSection", items: rxRecommendData)]
            }
            .subscribe(onNext: communityRecommendContents.onNext(_:))
            .disposed(by: disposeBag)
        recommendCollectionViewContents = communityRecommendContents
        
        
        
        let fetchingTable = PublishSubject<RequestType>()
        
        let communityTaebleContents = BehaviorSubject<[RxDataSection]>(value: [])
        
        fetchTableData = fetchingTable.asObserver()
        
        fetchingTable
            .flatMap(domain.tableFetch)
            .map{rxTableData in
                return [RxDataSection(model: "secondSection", items: rxTableData)]
            }
            .subscribe(onNext: communityTaebleContents.onNext )
            .disposed(by: disposeBag)
        
        tableViewContents = communityTaebleContents
        
    }
    
}

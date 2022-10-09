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
    var fetchRecommendCollectionData: AnyObserver<Void> { get }
//    var fetchTableData: AnyObserver<Void> { get }
    
    var recommendCollectionViewContents: Observable<[RxDataSection]> { get }
//    var talbleViewContents: Observable<[RxDataSection]> { get }
}


final class RxViewModel: RxViewModelType{
    
    let disposeBag = DisposeBag()
    
    var fetchRecommendCollectionData: AnyObserver<Void>
    
    
    var recommendCollectionViewContents: Observable<[RxDataSection]>
    
//    var fetchTableData: AnyObserver<Void>
//    var talbleViewContents: Observable<[RxDataSection]>
    
    
    init(_ domain: DataStoreSendType = DataStoreFetable()){
        
        let fetchingRecommend = PublishSubject<Void>()
        
        
        let communityRecommendContents = BehaviorSubject<[RxDataSection]>(value: [])
        
        
        // collectionView Recommend Setting
        fetchRecommendCollectionData = fetchingRecommend.asObserver()
        
        fetchingRecommend
        //        Observable<[RxData]>
            .flatMap(domain.collectionFetch)
            .map{rxRecommendData in
                
                var section: [RxDataSection] = []
                
                section.append(RxDataSection(model: "firstSection", items: rxRecommendData))
                
                return section
            }
            .subscribe(onNext: communityRecommendContents.onNext(_:))
            .disposed(by: disposeBag)
        recommendCollectionViewContents = communityRecommendContents
        
        //
        //        let fetchingTable = PublishSubject<Void>()
        //        let communityTaebleContents = BehaviorSubject<[RxDataSection]>(value: [])
        //
        //        recommendCollectionViewContents = communityRecommendContents
        //
        //        fetchTableData = fetchingTable.asObserver()
        //
        //        fetchingTable
        //            .flatMap(domain.tableFetch)
        //            .map{rxTableData in
        //                var section: [RxDataSection] = []
        //
        //                section.append(RxDataSection(model: "secondSection", items: rxTableData))
        //
        //                return section
        //            }
        //            .subscribe(onNext: communityTaebleContents.onNext )
        //            .disposed(by: disposeBag)
        //
        //        talbleViewContents = communityTaebleContents
    }
    
}

//
//  RxViewModel.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/06.
//

import Foundation
import RxSwift

protocol DataStoreSendType {
    func fetch() -> Observable<[RxDataModel]>
}

class DataStoreFetable: DataStoreSendType{
    static var dummyCommunityModel: [RxDataModel] = [
        RxDataModel(headerTitle: "collection", items:
                        [CommuityDataModel(titleType: "문의", content:"실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
                         CommuityDataModel(titleType: "가격", content:"실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
                         CommuityDataModel(titleType: "전문가검색", content:"실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?")]),
        
        
        RxDataModel(headerTitle: "table", items:
                        [CommuityDataModel(titleType: "문의", content:"실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?")]),
        RxDataModel(headerTitle: "table", items:
                        [CommuityDataModel(titleType: "문의", content:"실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?")]),
        RxDataModel(headerTitle: "table", items:
                        [CommuityDataModel(titleType: "문의", content:"실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?")]),
        RxDataModel(headerTitle: "table", items:
                        [CommuityDataModel(titleType: "문의", content:"실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?")]),
        RxDataModel(headerTitle: "table", items:
                        [CommuityDataModel(titleType: "문의", content:"실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?")])
    ]
    
    func fetch() -> Observable<[RxDataModel]> {
        return Observable.create{ emiter in
        
            emiter.onNext(DataStoreFetable.dummyCommunityModel)
        
            return Disposables.create()
            
        }
    }
}

//CommunitySection(model: "test",
//                          items: [RxDataModel(headerTitle: "message",
//                                              items: data)])


protocol RxViewModelType {
    var fetchListDataModel: AnyObserver<Void> { get }
    
    var allContents: Observable<[CommunitySection]> { get }
}


final class RxViewModel: RxViewModelType{
    
    let disposeBag = DisposeBag()
    
    var fetchListDataModel: AnyObserver<Void>
    
    
    var allContents: Observable<[CommunitySection]>
    
    
    init(_ domain: DataStoreSendType = DataStoreFetable()){
        
        let fetching = PublishSubject<Void>()
        
        let communityContents = BehaviorSubject<[CommunitySection]>(value: [])
        
        
        fetchListDataModel = fetching.asObserver()
        
        fetching
            .flatMap(domain.fetch)
            .map{rxDataModels in
                var section: [CommunitySection] = []
                
                var typeOnemodels: [RxDataModel] = []
                var typeTwomodels: [RxDataModel] = []
                
                rxDataModels.forEach{ model in
                    if model.headerTitle == "collection"{
                        typeOnemodels.append(model)
                    }else{
                        typeTwomodels.append(model)
                    }
                }
                section.append(CommunitySection(model: "firstSection", items: typeOnemodels))
                section.append(CommunitySection(model: "secondSection", items: typeTwomodels))
                
                return section
            }
            .subscribe(onNext: communityContents.onNext(_:))
            .disposed(by: disposeBag)
        
        allContents = communityContents
        
    }
    
}

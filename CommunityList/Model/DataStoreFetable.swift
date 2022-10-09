//
//  DataStoreFetable.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/09.
//

import Foundation
import RxSwift


protocol DataStoreSendType {
    func collectionFetch() -> Observable<[RxData]> //collectionType
//    func tableFetch() -> Observable<[RxData]> // tableType
    
}

enum HeaderType: String {
    case collection = "collection"
    case table = "table"
}

class DataStoreFetable: DataStoreSendType{
    
    private var allCommunityDataList: [CommunityContainer] = File.dataLoad()
    
    
    func collectionFetch() -> Observable<[RxData]> {
        return Observable.create{ [weak self] emiter in
            
            guard let self = self else {return}
            
            var recommendModels = self.allCommunityDataList.map{containerData in
                
                return RxData(headerTitle: HeaderType.collection.rawValue,
                              items: [MultipleSectionModel.collectionItem(CommunityRecommendModel(communityData:
                                                                                                    containerData))])
            }
    
            emiter.onNext(recommendModels)
        
            return Disposables.create()
        }
    }
    
//    func tableFetch() -> Observable<[RxData]> {
//
//        return Observable.create{ [weak self] emiter in
//
//            guard let self = self else {return}
//
//            var tableModels = self.allCommunityDataList.map{containerData in
//                return RxData(headerTitle: HeaderType.table.rawValue,
//                       items: [MultipleSectionModel.tableItem(CommunityTableModel(communityData: containerData))])
//            }
//
//            emiter.onNext(tableModels)
//
//            return Disposables.create()
//        }
//    }
}

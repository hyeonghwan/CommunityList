//
//  DataStoreFetable.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/09.
//

import Foundation
import RxSwift


protocol DataStoreSendType {
    func collectionFetch(_ requestType: RequestType) -> Observable<[RxData]> //collectionType
    func tableFetch(_ requestType: RequestType) -> Observable<[RxData]> // tableType
    
}

enum HeaderType: String {
    case collection = "collection"
    case table = "table"
}

class DataStoreFetable: DataStoreSendType{
    
    private var allCommunityDataList: [CommunityContainer] = File.allRequestDataLoad()
    
    
    func collectionFetch(_ requestType: RequestType) -> Observable<[RxData]> {
        return Observable.create{ [weak self] emiter in
            
            guard let self = self else {return Disposables.create()}
            
            var multipleSectionModels: [MultipleSectionModel] = []
            
            switch requestType{
            case .all:
                multipleSectionModels
                =
                self.allCommunityDataList.map{ filteredData in
                    return MultipleSectionModel.collectionItem(CommunityRecommendModel(communityData: filteredData))
                }
                
            case .ask,.request,.expertSearching,.price,.etc:
                multipleSectionModels
                =
                self.allCommunityDataList
                    .filter{ $0.headerTitleType == requestType}
                    .map{ filteredData in
                    return MultipleSectionModel.collectionItem(CommunityRecommendModel(communityData: filteredData))
                }
            }
            
             // [Rxdata] count -> must have one count    [Rxdata].count == 1
             //[MultipleSectionModel] count --> possible multipleSectionModels    [MultipleSectionModel] >= 1
            let recommendModels = [RxData(headerTitle: HeaderType.collection.rawValue, items: multipleSectionModels)]
            
            emiter.onNext(recommendModels)
        
            return Disposables.create()
        }
    }
    
    func tableFetch(_ requestType: RequestType) -> Observable<[RxData]> {

        return Observable.create{ [weak self] emiter in

            guard let self = self else {return Disposables.create()}

            var tableModels: [RxData] = []
            
            switch requestType{
                
            case .all:
                tableModels = self.allCommunityDataList.map{containerData in
                    return RxData(headerTitle: HeaderType.table.rawValue,
                                  items: [MultipleSectionModel.tableItem(CommunityTableModel(communityData: containerData))])
                }
                
            case .ask,.request,.expertSearching,.price,.etc:
                tableModels = self.allCommunityDataList.map{containerData in
                    return RxData(headerTitle: HeaderType.table.rawValue,
                                  items: [MultipleSectionModel.tableItem(CommunityTableModel(communityData: containerData))])
                }
            }
            
            // tableModels.count --> maybe one more >= 1
            // RxData.items.count --> must have one == 1
            emiter.onNext(tableModels)

            return Disposables.create()
        }
    }
}

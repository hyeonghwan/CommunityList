//
//  CommunityDataModel.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/07.
//

import Foundation
import RxDataSources

protocol CommunityIdentiable {
    var communityData: CommunityContainer { get }
}

struct CommunityContainer {
    
    var headerTitleType: RequestType
    var content: String
    var timeWhenWrite: String = ["2021-10-01 18:07:27",
                                 "2022-08-01 18:07:27",
                                 "2022-10-01 18:07:27",
                                 "2022-10-12 16:07:27",
                                 "2022-10-12 18:07:27",
                                 "2022-10-12 18:35:27",
                                 "2022-10-12 18:07:27"].randomElement()!
    var heartCount: String = "1.4k"
    var commentCount: String = "1k"
    
    init(){
        self.headerTitleType = .etc
        self.content = ""
    }
    
    init(headerTitleType: RequestType, content: String, timeWhenWrite: String, heartCount: String, commentCount: String) {
        self.headerTitleType = headerTitleType
        self.content = content
        self.timeWhenWrite = timeWhenWrite
        self.heartCount = heartCount
        self.commentCount = commentCount
    }
}

extension CommunityContainer: IdentifiableType,Equatable{
    var identity: String {
            return UUID().uuidString
        }
}


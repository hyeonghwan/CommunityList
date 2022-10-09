//
//  file.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/09.
//

import Foundation


class File{
    static func dataLoad() -> [CommunityContainer] {
        
        let dummyRecommendData = [
            CommunityContainer(headerTitleType: "문의", content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: "문의", content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: "문의", content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: "문의", content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: "문의", content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: "문의", content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?")
        ]
        return dummyRecommendData
    }
}

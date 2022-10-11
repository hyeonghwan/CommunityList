//
//  file.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/09.
//

import Foundation


enum RequestType: String{
    case all = "전체"
    case ask = "문의"
    case price = "가격"
    case expertSearching = "전문가검색"
    case request = "의뢰하기"
    case etc = "기타문의"
}

class File{
    
    static func allRequestDataLoad() -> [CommunityContainer]{
        let data: [CommunityContainer] = [
            CommunityContainer(headerTitleType: RequestType.ask, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.ask, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.ask, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.ask, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.expertSearching, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.expertSearching, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.price, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.etc, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.ask, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.etc, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.etc, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.expertSearching, content: "문의드립니다."),
            CommunityContainer(headerTitleType: RequestType.price, content: "가격문의 드립니다."),
            CommunityContainer(headerTitleType: RequestType.expertSearching, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.expertSearching, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.etc, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.etc, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.ask, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.expertSearching, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.ask, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.request, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.expertSearching, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.expertSearching, content: "가격문의 드립니다."),
            CommunityContainer(headerTitleType: RequestType.price, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.price, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.ask, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.expertSearching, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.expertSearching, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.request, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.request, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.request, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?"),
            CommunityContainer(headerTitleType: RequestType.ask, content: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?")
        ]
        return data
    }
}

//
//  DateFormat.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/12.
//

import Foundation

//extension Array where Element == String {
//    func randomGenerator() -> String {
//        self.randomElement()
//    }
//}
class DateFormat{

    
    var date: Date = Date()
    var formatter: DateFormatter = DateFormatter()
    
    init(){
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST") // "2018-03-21 18:07:27"
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    
    func currentTime() -> String {
        let kr = formatter.string(from: date)
        
        print("krTime \(kr)")
        
        return kr
    }
    
    func caluculateTime(_ dateString: String) -> String{
        let current = self.currentTime()
        
        let difference = formatter.date(from: current)! - formatter.date(from: dateString)!
        
        print("timeInterval : \(difference)")
        
        return difference.stringFromTimeInterval()
    }
}

enum TimeDiffereceType: String {
    case defalut = "방금 전"
    case minute = "분 전"
    case hour = "시간 전"
    case day = "일 전"
    case month = "달 전"
    case year = "년 전"
}
extension TimeInterval{

    func stringFromTimeInterval() -> String {

        let time = NSInteger(self)
        
        let year = (time / 3600) / 8064
        if year != 0 {return String(year) + TimeDiffereceType.year.rawValue }
        
        let month = (time / 3600) / 672
        if month != 0 {return String(month) + TimeDiffereceType.month.rawValue }
        
        let days = (time / 3600) / 24
        if days != 0 {return String(days) + TimeDiffereceType.day.rawValue }
        
        let hours = (time / 3600)
        if hours != 0 {return String(hours) + TimeDiffereceType.hour.rawValue }
        
        let minutes = (time / 60) % 60
        if minutes != 0 {return String(minutes) + TimeDiffereceType.minute.rawValue }
        
        let seconds = time % 60
        if seconds != 0 {return TimeDiffereceType.defalut.rawValue }
        
        
        return TimeDiffereceType.defalut.rawValue
        
    }
}

extension Date {
    public static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
    
}



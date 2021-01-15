import UIKit

/*
 Given a string date representing a Gregorian calendar date formatted as YYYY-MM-DD, return the day number of the year.

 Example 1:
 Input: date = "2019-01-09"
 Output: 9
 Explanation: Given date is the 9th day of the year in 2019.
 
 Example 2:
 Input: date = "2019-02-10"
 Output: 41
 
 Example 3:
 Input: date = "2003-03-01"
 Output: 60
 
 Example 4:
 Input: date = "2004-03-01"
 Output: 61
  
 Constraints:
 date.length == 10
 date[4] == date[7] == '-', and all other date[i]'s are digits
 date represents a calendar date between Jan 1st, 1900 and Dec 31, 2019.
 */

/// answer1
class Solution1 {
    
    func dayOfYear(_ date: String) -> Int {
        let firstOfYear = "\(date.components(separatedBy: "-")[0])-01-01"
        let calendar = Calendar.current
        let finalDate = calendar.startOfDay(for: Date(date))
        let firstOfTheYear = calendar.startOfDay(for: Date(firstOfYear))
        return calendar.dateComponents([.day], from: firstOfTheYear, to: finalDate).day! + 1
    }
}

extension Date {
    
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
}

/// answer2
class Solution2 {
    
    func dayOfYear(_ date: String) -> Int {
        let dateArray = date.components(separatedBy: "-")
        let year = dateArray[0]
        let firstDay = year + "-01-01"
        let d1 = dateFromString(date)
        let d2 = dateFromString(firstDay)
        
        let difference = d1.timeIntervalSince(d2)
        return Int(difference/86400) + 1
    }
    
    func dateFromString(_ date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: date)!
    }
}

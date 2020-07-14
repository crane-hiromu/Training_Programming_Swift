import UIKit

/*
 Write a function to find the longest common prefix string amongst an array of strings.
 If there is no common prefix, return an empty string "".

 Example 1:
 Input: ["flower","flow","flight"]
 Output: "fl"
 
 Example 2:
 Input: ["dog","racecar","car"]
 Output: ""
 
 Explanation: There is no common prefix among the input strings.
 */

/// answer1
func longestCommonPrefix1(_ strs: [String]) -> String {
    /// ignore exception
    guard !(strs.count == 0) else { return "" }
    guard !(strs.count == 1) else { return strs[0] }
    
    /// ignore exception
    let minStr = strs.sorted { $0.count < $1.count }[0]
    guard !(minStr.count == 0) else { return "" }
    
    /// ignore target number(minStr) to calc quickly
    var newStrs = strs
    if let i = newStrs.firstIndex(of: minStr) {
        newStrs.remove(at: i)
    }

    var result = ""
    
    for k in (1...minStr.count) {
        var containsStr = ""

        for str in newStrs {
            let res = minStr.prefix(k)

            if !str.prefix(k).contains(res) {
                containsStr = ""
                break
            }
            containsStr = String(res)
        }

        if result.count < containsStr.count {
            result = containsStr
        }
    }
    
    return result
}

/// answer2 (from discuss, swifty code)
func longestCommonPrefix2(_ strs: [String]) -> String {
    if strs.count == 0 { return "" }
   
    var minStr = (strs.min{$0.count < $1.count})!
    
    for str in strs {
        while !str.hasPrefix(minStr) { // 接頭が一致
             minStr.removeLast()
        }
    }
    
    return minStr
}

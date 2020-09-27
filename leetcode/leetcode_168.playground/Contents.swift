import UIKit

/*
 Given a positive integer, return its corresponding column title as appear in an Excel sheet.

 For example:

     1 -> A
     2 -> B
     3 -> C
     ...
     26 -> Z
     27 -> AA
     28 -> AB
     ...
 Example 1:

 Input: 1
 Output: "A"
 Example 2:

 Input: 28
 Output: "AB"
 Example 3:

 Input: 701
 Output: "ZY"
 */

/// answer1 ( from discuss )
func convertToTitle1(_ n: Int) -> String {
    let chars = (65...90).map { String(Character(UnicodeScalar($0))) }
    var result = "", current = n
    
    while 0 < current {
        let diff = (current-1)
        result = chars[diff % 26] + result
        current = diff / 26
    }
    return result
}

/// answer2 ( from discuss )
func convertToTitle2(_ n: Int) -> String {
    guard 26 < n else { return String(UnicodeScalar(64 + n)!) }
    return convertToTitle2((n - 1) / 26) + convertToTitle2((n - 1) % 26 + 1)
}

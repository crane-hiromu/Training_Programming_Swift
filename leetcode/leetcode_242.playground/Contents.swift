import UIKit

/*
 Given two strings s and t, return true if t is an anagram of s, and false otherwise.

 Example 1:
 Input: s = "anagram", t = "nagaram"
 Output: true
 
 Example 2:
 Input: s = "rat", t = "car"
 Output: false

 Constraints:
 1 <= s.length, t.length <= 5 * 104
 s and t consist of lowercase English letters.
 Follow up: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?
 */

func isAnagram(_ s: String, _ t: String) -> Bool {
     Array(s).sorted() == Array(t).sorted()
}

func isAnagram2(_ s: String, _ t: String) -> Bool {
    var dict = [Character: Int](), ars = Array(s), art = Array(t)
    let count = s.count < t.count ? t.count : s.count
    
    (0..<count).forEach { index in
        if index < ars.count {
            dict[ars[index]] = (dict[ars[index]] ?? 0) + 1
        }
        if index < art.count {
            dict[art[index]] = (dict[art[index]] ?? 0) - 1
        }
    }
    
    return dict.values.first { $0 != 0 } == nil
}

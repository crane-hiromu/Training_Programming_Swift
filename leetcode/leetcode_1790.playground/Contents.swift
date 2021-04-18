import UIKit

/*
 You are given two strings s1 and s2 of equal length. A string swap is an operation where you choose two indices in a string (not necessarily different) and swap the characters at these indices.

 Return true if it is possible to make both strings equal by performing at most one string swap on exactly one of the strings. Otherwise, return false.

  

 Example 1:
 Input: s1 = "bank", s2 = "kanb"
 Output: true
 Explanation: For example, swap the first character with the last character of s2 to make "bank".
 
 Example 2:
 Input: s1 = "attack", s2 = "defend"
 Output: false
 Explanation: It is impossible to make them equal with one string swap.
 
 Example 3:
 Input: s1 = "kelb", s2 = "kelb"
 Output: true
 Explanation: The two strings are already equal, so no string swap operation is required.
 
 Example 4:
 Input: s1 = "abcd", s2 = "dcba"
 Output: false
  
 Constraints:
 1 <= s1.length, s2.length <= 100
 s1.length == s2.length
 s1 and s2 consist of only lowercase English letters.
 */

func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
    guard Set(s1) == Set(s2) else { return false }
    
    let ar1 = Array(s1), ar2 = Array(s2)
    var counter = 0
    
    for i in 0..<s1.count {
        guard ar1[i] != ar2[i] else { continue }
        counter += 1
    }
    
    // 完全一致 or 一回入れ替えのみ
    return counter == 0 || counter == 2
}

import UIKit

/*
 A string is good if there are no repeated characters.
 Given a string s​​​​​, return the number of good substrings of length three in s​​​​​​.
 Note that if there are multiple occurrences of the same substring, every occurrence should be counted.
 A substring is a contiguous sequence of characters in a string.

 Example 1:
 Input: s = "xyzzaz"
 Output: 1
 Explanation: There are 4 substrings of size 3: "xyz", "yzz", "zza", and "zaz".
 The only good substring of length 3 is "xyz".
 
 Example 2:
 Input: s = "aababcabc"
 Output: 4
 Explanation: There are 7 substrings of size 3: "aab", "aba", "bab", "abc", "bca", "cab", and "abc".
 The good substrings are "abc", "bca", "cab", and "abc".
  
 Constraints:
 1 <= s.length <= 100
 s​​​​​​ consists of lowercase English letters.
 */

func countGoodSubstrings(_ s: String) -> Int {
    guard 2 < s.count else { return 0 }
    
    return (0...s.count-3).filter {
        let from = s.index(s.startIndex, offsetBy:$0)
        let to = s.index(s.startIndex, offsetBy:$0+3)
        let str = String(s[from..<to])
        return Set(Array(str)).count == 3
    }.count
}

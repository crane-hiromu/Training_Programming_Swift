import UIKit

/*
 Given a string, find the length of the longest substring without repeating characters.

 Example 1:
 Input: "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 
 Example 2:
 Input: "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 
 Example 3:
 Input: "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
              Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */

/// failed answer (multiple linear search - time out)
func lengthOfLongestSubstring(_ s: String) -> Int {
    let strArray = Array(s)
    var array = strArray, lastResult = "", result = "", counter = 0
    
    while !array.isEmpty {
        let str = array[0]
        
        if lastResult.contains(str) {
            if result.count < lastResult.count {
                result = lastResult
            }
            lastResult = ""
            counter += 1
            array = strArray
            for _ in (0..<counter) {
                array.remove(at: 0)
            }
            continue
        }
        
        lastResult = "\(lastResult)\(str)"
        array.remove(at: 0)
    }
    
    if result.count < lastResult.count {
        result = lastResult
    }
    return result.count
}

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

/// answer1 - failed (multiple linear search - time out)
func lengthOfLongestSubstring1(_ s: String) -> Int {
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

/// answer2 (from discuss -  linear search)
func lengthOfLongestSubstring2(_ s: String) -> Int {
    guard !s.isEmpty else { return 0 }

    var length = 0
    var substring = [Character]()
    for c in s {
        if substring.contains(c), let index = substring.firstIndex(of: c) {
            length = max(length, substring.count)
            substring.removeSubrange(0...index)
        }
        substring.append(c)
    }

    return max(length, substring.count)
}

/// answer3 - failed (slideing window - time out)
/// String
func lengthOfLongestSubstring3(_ s: String) -> Int {
    let count = s.count
    var set = Set<String>()
    var ans = 0, i = 0, j = 0
    
    while i<count && j<count {
        if !set.contains(String(s.prefix(j+1).suffix(1))) {
            set.insert(String(s.prefix(j+1).suffix(1)))
            j += 1
            ans = max(ans, j-i)
        } else {
            set.remove(String(s.prefix(i+1).suffix(1)))
            i += 1
        }
    }
    return ans
}

/// answer4 - failed (slideing window - time out)
/// Substring
func lengthOfLongestSubstring4(_ s: String) -> Int {
    let count = s.count
    var set = Set<Substring>()
    var ans = 0, i = 0, j = 0
    
    while i<count && j<count {
        if !set.contains(s.prefix(j+1).suffix(1)) {
            set.insert(s.prefix(j+1).suffix(1))
            j += 1
            ans = max(ans, j-i)
        } else {
            set.remove(s.prefix(i+1).suffix(1))
            i += 1
        }
    }
    return ans
}

/// answer5 (sliding window)
func lengthOfLongestSubstring5(_ s: String) -> Int {
    let count = s.count
    var set = Set<Character>()
    var ans = 0, i = 0, j = 0

    var charArr = [Character]()
    for char in s {
        charArr.append(char)
    }
    
    while i<count && j<count {
        if !set.contains(charArr[j]) {
            set.insert(charArr[j])
            j += 1
            ans = max(ans, j-i)
        } else {
            set.remove(charArr[i])
            i += 1
        }
    }
    return ans
}

import UIKit

/*
 Implement strStr().
 Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 Example 1:
 Input: haystack = "hello", needle = "ll"
 Output: 2
 
 Example 2:
 Input: haystack = "aaaaa", needle = "bba"
 Output: -1
 */

/// timeout of last test case
func strStr(_ haystack: String, _ needle: String) -> Int {
    guard !needle.isEmpty else { return 0 }
    
    let count = haystack.components(separatedBy: needle)[0].count
    
    guard count != haystack.count else { return -1 }
    
    return count
}

/// answer
func strStr2(_ haystack: String, _ needle: String) -> Int {
    if haystack.count == needle.count {
        return haystack != needle ? -1 : 0
    } else if needle.isEmpty {
        return 0
    }
    
    let count = haystack.components(separatedBy: needle)[0].count
    return count != haystack.count ? count : -1
}

/// from discuss interresting answer
func strStr3(_ haystack: String, _ needle: String) -> Int {
    if haystack.count == needle.count {
        return haystack != needle ? -1 : 0
    } else if let index = haystack.range(of: needle) {
        return haystack.distance(from: haystack.startIndex, to: index.lowerBound)
    } else {
        return needle.isEmpty ? 0 : -1
    }
}

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

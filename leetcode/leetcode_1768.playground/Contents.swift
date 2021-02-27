import UIKit

/*
 You are given two strings word1 and word2. Merge the strings by adding letters in alternating order, starting with word1. If a string is longer than the other, append the additional letters onto the end of the merged string.
 Return the merged string.
 
 Example 1:
 Input: word1 = "abc", word2 = "pqr"
 Output: "apbqcr"
 Explanation: The merged string will be merged as so:
 word1:  a   b   c
 word2:    p   q   r
 merged: a p b q c r
 
 Example 2:
 Input: word1 = "ab", word2 = "pqrs"
 Output: "apbqrs"
 Explanation: Notice that as word2 is longer, "rs" is appended to the end.
 word1:  a   b
 word2:    p   q   r   s
 merged: a p b q   r   s
 
 Example 3:
 Input: word1 = "abcd", word2 = "pq"
 Output: "apbqcd"
 Explanation: Notice that as word1 is longer, "cd" is appended to the end.
 word1:  a   b   c   d
 word2:    p   q
 merged: a p b q c   d
  
 Constraints:
 1 <= word1.length, word2.length <= 100
 word1 and word2 consist of lowercase English letters.
 */

/// answer1
func mergeAlternately1(_ word1: String, _ word2: String) -> String {
    let count = (word1.count < word2.count) ? word1.count : word2.count
    var array1 = Array(word1), array2 = Array(word2)
    
    var result = ""
    (0..<count).forEach { _ in
        result.append(String(array1.removeFirst()))
        result.append(String(array2.removeFirst()))
    }
    result.append(array1.map(String.init).reduce("", +))
    result.append(array2.map(String.init).reduce("", +))
    return result
}

/// answer2
func mergeAlternately2(_ word1: String, _ word2: String) -> String {
    var array1 = Array(word1), array2 = Array(word2), result = ""
    
    (0..<max(word1.count, word2.count)).forEach { _ in
        result.append(array1.isEmpty ? "" : String(array1.removeFirst()))
        result.append(array2.isEmpty ? "" : String(array2.removeFirst()))
    }
    return result
}

/// answer3
func mergeAlternately3(_ word1: String, _ word2: String) -> String {
    let c1 = word1.count, c2 = word2.count
    var a1 = Array(word1).map(String.init), a2 = Array(word2).map(String.init)
    
    if c1 < c2 {
        (0..<c2-c1).forEach { _ in a1.append("") }
    } else {
        (0..<c1-c2).forEach { _ in a2.append("") }
    }
    
    var result = ""
    for (ch1, ch2) in zip(a1, a2) {
        result.append(ch1)
        result.append(ch2)
    }
    return result
}

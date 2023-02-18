import UIKit

/*
 You are given two strings order and s. All the characters of order are unique and were sorted in some custom order previously.

 Permute the characters of s so that they match the order that order was sorted. More specifically, if a character x occurs before a character y in order, then x should occur before y in the permuted string.

 Return any permutation of s that satisfies this property.

 Example 1:
 Input: order = "cba", s = "abcd"
 Output: "cbad"
 Explanation:
 "a", "b", "c" appear in order, so the order of "a", "b", "c" should be "c", "b", and "a".
 Since "d" does not appear in order, it can be at any position in the returned string. "dcba", "cdba", "cbda" are also valid outputs.
 
 Example 2:
 Input: order = "cbafg", s = "abcd"
 Output: "cbad"
  
 Constraints:
 1 <= order.length <= 26
 1 <= s.length <= 200
 order and s consist of lowercase English letters.
 All the characters of order are unique.
 */

class Solution {
    func customSortString(_ order: String, _ s: String) -> String {
        var dict = s.reduce(into: [Character: Int]()) { dict, char in
            dict[char, default: 0] += 1
        }

        var result = ""

        for char in order {
            if let value = dict[char] {
                result += Array(repeating: "\(char)", count: value).reduce("", +)
                dict[char] = nil

                
            }
        }

        result += dict
            .flatMap { Array(repeating: $0.key, count: $0.value) }
            .reduce("", +)

        return result
    }
}

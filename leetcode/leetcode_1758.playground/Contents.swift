import UIKit

/*
 You are given a string s consisting only of the characters '0' and '1'. In one operation, you can change any '0' to '1' or vice versa.
 The string is called alternating if no two adjacent characters are equal. For example, the string "010" is alternating, while the string "0100" is not.
 Return the minimum number of operations needed to make s alternating.

 Example 1:
 Input: s = "0100"
 Output: 1
 Explanation: If you change the last character to '1', s will be "0101", which is alternating.
 
 Example 2:
 Input: s = "10"
 Output: 0
 Explanation: s is already alternating.
 
 Example 3:
 Input: s = "1111"
 Output: 2
 Explanation: You need two operations to reach "0101" or "1010".
  
 Constraints:
 1 <= s.length <= 104
 s[i] is either '0' or '1'.
 */

// answer1
func minOperations1(_ s: String) -> Int {
    var result = 0
    let array = Array(s), count = array.count
    
    for i in (0..<count) {
        if (array[i] == "0" ? 0 : 1) % 2 == i % 2 {
            result += 1
        }
    }
    return min(result, count-result)
}

// answer2
func minOperations2(_ s: String) -> Int {
    var result = 0
    
    for (i, char) in s.enumerated() {
        if (char == "0" ? 0 : 1) % 2 == i % 2 {
            result += 1
        }
    }
    return min(result, s.count-result)
}

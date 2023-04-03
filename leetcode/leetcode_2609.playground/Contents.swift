/*
 Given two arrays of unique digits nums1 and nums2, return the smallest number that contains at least one digit from each array.
 You are given a binary string s consisting only of zeroes and ones.

 A substring of s is considered balanced if all zeroes are before ones and the number of zeroes is equal to the number of ones inside the substring. Notice that the empty substring is considered a balanced substring.

 Return the length of the longest balanced substring of s.

 A substring is a contiguous sequence of characters within a string.

 Example 1:
 Input: s = "01000111"
 Output: 6
 Explanation: The longest balanced substring is "000111", which has length 6.
 
 Example 2:
 Input: s = "00111"
 Output: 4
 Explanation: The longest balanced substring is "0011", which has length 4.
 
 Example 3:
 Input: s = "111"
 Output: 0
 Explanation: There is no balanced substring except the empty substring, so the answer is 0.
  
 Constraints:
 1 <= s.length <= 50
 '0' <= s[i] <= '1'
 */

class Solution {
    func findTheLongestBalancedSubstring(_ s: String) -> Int {
        var c0 = 0, c1 = 0, last = Character(" "), result = 0

        for char in s {
            if char == "0" {
                if last == "1" {
                    result = max(result, min(c0, c1))
                    c0 = 0
                    c1 = 0

                }
                c0 += 1
            } else if char == "1" {
                c1 += 1
            }
            last = char
        }
        result = max(result, min(c0, c1))
        return result*2
    }
}

import UIKit

/*
 Write a program to check whether a given number is an ugly number.
 Ugly numbers are positive numbers whose prime factors only include 2, 3, 5.

 Example 1:
 Input: 6
 Output: true
 Explanation: 6 = 2 × 3
 
 Example 2:
 Input: 8
 Output: true
 Explanation: 8 = 2 × 2 × 2
 
 Example 3:
 Input: 14
 Output: false
 Explanation: 14 is not ugly since it includes another prime factor 7.
 Note:

 1 is typically treated as an ugly number.
 Input is within the 32-bit signed integer range: [−231,  231 − 1].
 */

/// answer1
func isUgly1(_ num: Int) -> Bool {
    guard num != 0 else { return false }
    
    var n = num
    
    while n % 2 == 0 {
        n = n / 2
    }
    while n % 3 == 0 {
        n = n / 3
    }
    while n % 5 == 0 {
        n = n / 5
    }
    
    return n == 1
}

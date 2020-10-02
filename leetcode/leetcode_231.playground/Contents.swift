import UIKit

/*
 Given an integer n, write a function to determine if it is a power of two.

 Example 1:
 Input: n = 1
 Output: true
 Explanation: 20 = 1
 
 Example 2:
 Input: n = 16
 Output: true
 Explanation: 24 = 16
 
 Example 3:
 Input: n = 3
 Output: false
 
 Example 4:
 Input: n = 4
 Output: true
 
 Example 5:
 Input: n = 5
 Output: false

 Constraints:
 -231 <= n <= 231 - 1
 */

/// answer1
func isPowerOfTwo1(_ n: Int) -> Bool {
    guard n != 0 else { return false }
    
    var num = n
    while num % 2 == 0 {
        num = num/2
    }
    return num == 1
}

/// answer2 (2進数で考えられるので、nとn-1の値で判定できる)
func isPowerOfTwo2(_ n: Int) -> Bool {
    return (0 < n) ? ((n & (n - 1)) == 0) : false
}

import UIKit

/*
 Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.

 Example:
 Input: 38
 Output: 2
 
 Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2.
              Since 2 has only one digit, return it.
 Follow up:
 Could you do it without any loop/recursion in O(1) runtime?
 */

/// answer1
func addDigits1(_ num: Int) -> Int {
    let result = String(num).compactMap { Int(String($0)) }.reduce(0, +)
    return result < 10 ? result : addDigits1(result)
}

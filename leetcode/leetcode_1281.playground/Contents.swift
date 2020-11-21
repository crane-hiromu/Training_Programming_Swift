import UIKit

/*
 Given an integer number n, return the difference between the product of its digits and the sum of its digits.
  
 Example 1:
 Input: n = 234
 Output: 15
 Explanation:
 Product of digits = 2 * 3 * 4 = 24
 Sum of digits = 2 + 3 + 4 = 9
 Result = 24 - 9 = 15
 
 Example 2:
 Input: n = 4421
 Output: 21
 Explanation:
 Product of digits = 4 * 4 * 2 * 1 = 32
 Sum of digits = 4 + 4 + 2 + 1 = 11
 Result = 32 - 11 = 21
  
 Constraints:
 1 <= n <= 10^5
 */

/// answer1
func subtractProductAndSum1(_ n: Int) -> Int {
    let nums = Array(String(n))
    var sum = 0
    var mult = 1
    
    for num in nums {
        sum += Int(String(num))!
        mult *= Int(String(num))!
    }
    
    return mult - sum
}


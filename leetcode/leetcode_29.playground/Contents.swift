import UIKit

/*
 Given two integers dividend and divisor, divide two integers without using multiplication, division and mod operator.
 Return the quotient after dividing dividend by divisor.
 The integer division should truncate toward zero, which means losing its fractional part. For example, truncate(8.345) = 8 and truncate(-2.7335) = -2.

 Example 1:
 Input: dividend = 10, divisor = 3
 Output: 3
 Explanation: 10/3 = truncate(3.33333..) = 3.
 
 Example 2:
 Input: dividend = 7, divisor = -3
 Output: -2
 Explanation: 7/-3 = truncate(-2.33333..) = -2.
 
 Note:
 Both dividend and divisor will be 32-bit signed integers.
 The divisor will never be 0.
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 231 − 1 when the division result overflows.
 */

/// answer1
func divide1(_ dividend: Int, _ divisor: Int) -> Int {
    let result = dividend / divisor
    
    let max = Int(pow(2.0, 31.0))-1
    let min = Int(pow(-2.0, 31.0))
    
    if result < min {
        return min
    } else if max < result {
        return max
    }
    return result
}


/// answer2(from discuss)
func divide2(_ dividend: Int, _ divisor: Int) -> Int {
    let result = dividend / divisor
    guard Int32.min <= result, result <= Int32.max else { return Int(Int32.max) }
    return result
}

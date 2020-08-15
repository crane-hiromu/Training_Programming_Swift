import UIKit

/*
 Write an algorithm to determine if a number n is "happy".

 A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.
 Return True if n is a happy number, and False if not.

 Example:
 Input: 19
 Output: true
 Explanation:
 12 + 92 = 82
 82 + 22 = 68
 62 + 82 = 100
 12 + 02 + 02 = 1
 */

/// answer1
var numbers = [Int]()
func isHappy1(_ n: Int) -> Bool {
    let result = String(n).compactMap { Int(String($0)) }.map { $0*$0 }.reduce(0, +)
            
    if result == 1 {
        return true
    } else if numbers.contains(result) {
        return false
    }
    
    numbers.append(result)
    return isHappy1(result)
}


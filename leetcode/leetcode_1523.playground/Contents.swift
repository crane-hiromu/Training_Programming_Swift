import UIKit

/*
 Given two non-negative integers low and high. Return the count of odd numbers between low and high (inclusive).

 Example 1:
 Input: low = 3, high = 7
 Output: 3
 Explanation: The odd numbers between 3 and 7 are [3,5,7].
 
 Example 2:
 Input: low = 8, high = 10
 Output: 1
 Explanation: The odd numbers between 8 and 10 are [9].
  
 Constraints:
 0 <= low <= high <= 10^9
 */

/// failed answer1 ( time out )
func countOdds1(_ low: Int, _ high: Int) -> Int {
    return (low...high).filter { $0 % 2 != 0 }.count
}

/// answer2
func countOdds2(_ low: Int, _ high: Int) -> Int {
    return high / 2 + (high % 2 == 0 ? 0 : 1) - low / 2
}
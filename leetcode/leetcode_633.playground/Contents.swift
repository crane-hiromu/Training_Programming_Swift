import UIKit

/*
 Given a non-negative integer c, your task is to decide whether there're two integers a and b such that a2 + b2 = c.

 Example 1:
 Input: 5
 Output: True
 Explanation: 1 * 1 + 2 * 2 = 5
  

 Example 2:
 Input: 3
 Output: False
 */

/// time limit (linear search)
func judgeSquareSum(_ c: Int) -> Bool {
    guard 1 < c else { return true } // ignore 0, 1
    
    let n = 0
    var m = c-1
            
    while n <= m {
        for k in (n...m) {
            if k*k+m*m == c {
                return true
            }
              
        }
        m -= 1
    }
    return false
}

/// time limit (binary search)
func judgeSquareSum2(_ c: Int) -> Bool {
    var left = 0
    var right = Int(sqrt(Double(c)))
    
    while left <= right {
        let sum = left * left + right * right
        
        if sum == c {
            return true
        } else if sum < c {
            left += 1
        } else {
            right -= 1
        }
    }
    
    return false
}

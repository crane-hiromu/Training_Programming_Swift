import UIKit

/*
 Given a positive integer num, write a function which returns True if num is a perfect square else False.
 Follow up: Do not use any built-in library function such as sqrt.

 Example 1:
 Input: num = 16
 Output: true
 Example 2:

 Input: num = 14
 Output: false
  

 Constraints:
 1 <= num <= 2^31 - 1
 */

/// easy answer
func isPerfectSquare(_ num: Int) -> Bool {
    let k = Int(sqrt(Double(num)))
    return (k*k == num)
}


/// binary serach
func isPerfectSquare2(_ num: Int) -> Bool {
    guard num != 1 else { return true } // ignore 1
    
    var left = 1
    var right = num/2
    
    while left <= right {
        let m = (left+right)/2
        
        if m*m <= num, num < (m+1)*(m+1) {
            return (m*m == num)
        } else if m*m < num {
            left = m+1
        } else if num < m*m {
            right = m-1
        }
    }
    return false
}

/// Linear search
func isPerfectSquare3(_ num: Int) -> Bool {
    var curr = 1
    
    while true {
        if curr * curr == num { return true }
        if curr * curr > num { return false }
        
        curr += 1
    }
}

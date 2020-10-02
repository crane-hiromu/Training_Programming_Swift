import UIKit

/*
 Given an integer, write a function to determine if it is a power of three.

 Example 1:
 Input: 27
 Output: true
 
 Example 2:
 Input: 0
 Output: false
 
 Example 3:
 Input: 9
 Output: true
 
 Example 4:
 Input: 45
 Output: false
 
 Follow up:
 Could you do it without using any loop / recursion?
 */

/// answer1
func isPowerOfThree1(_ n: Int) -> Bool {
    guard 0 < n else { return false }
    
    var num = n
    while num % 3 == 0 {
        num = num / 3
    }
    return num == 1
}

/// answer2
func isPowerOfThree2(_ n: Int) -> Bool {
    return 0 < n && n <= Int.max && Int(pow(Double(3), Double(19))) % n == 0
}

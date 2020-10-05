import UIKit

/*
 Given an integer array arr, return true if there are three consecutive odd numbers in the array. Otherwise, return false.
  
 Example 1:
 Input: arr = [2,6,4,1]
 Output: false
 Explanation: There are no three consecutive odds.
 
 Example 2:
 Input: arr = [1,2,34,3,4,5,7,23,12]
 Output: true
 Explanation: [5,7,23] are three consecutive odds.

 Constraints:
 1 <= arr.length <= 1000
 1 <= arr[i] <= 1000
 */

func threeConsecutiveOdds(_ arr: [Int]) -> Bool {
    var counter = 0
    
    for num in arr {
        if num % 2 == 0 {
            counter = 0
        } else {
            counter += 1
        }
        
        if counter == 3 {
            return true
        }
    }
    
    return false
}

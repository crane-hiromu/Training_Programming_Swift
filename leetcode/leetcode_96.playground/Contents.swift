import UIKit

/*
 Given an integer n, return the number of structurally unique BST's (binary search trees) which has exactly n nodes of unique values from 1 to n.

 Example 1:
 Input: n = 3
 Output: 5
 
 Example 2:
 Input: n = 1
 Output: 1
  
 Constraints:
 1 <= n <= 19
 */

// DP
func numTrees(_ n: Int) -> Int {
    guard n > 1 else { return 1 }
    
    var map: [Int] = [1, 1]
    
    for i in 2...n {
        var tmp = 0
        
        for j in 0..<i {
            tmp += map[j] * map[i - j - 1]
        }
        map.append(tmp)
    }
    
    return map[n]
}

// カタラン数
func numTrees2(_ n: Int) -> Int {
    var result = 1
    
    guard 0 < n else { return result }
    
    for i in 1...n {
        result = result * 2 * (2 * i - 1) / (i + 1)
    }
    return result
}

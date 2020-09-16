import UIKit

/*
 Given an integer rowIndex, return the rowIndexth row of the Pascal's triangle.
 Notice that the row index starts from 0.
 In Pascal's triangle, each number is the sum of the two numbers directly above it.
 
 Follow up:
 Could you optimize your algorithm to use only O(k) extra space?

 Example 1:
 Input: rowIndex = 3
 Output: [1,3,3,1]
 
 Example 2:
 Input: rowIndex = 0
 Output: [1]
 
 Example 3:
 Input: rowIndex = 1
 Output: [1,1]
  
 Constraints:
 0 <= rowIndex <= 40
 */

/// answer ( 118の延長 )
func getRow(_ rowIndex: Int) -> [Int] {
    var result = [[Int]]()
    
    for i in 0...rowIndex {
        result.append([1])
        
        /// ignore first
        guard i != 0 else { continue }
        
        let prev = result[i-1]

        for k in 0..<prev.count-1 {
            result[i].append(prev[k]+prev[k+1])
        }
        result[i].append(1)
    }
    
    return result.last!
}

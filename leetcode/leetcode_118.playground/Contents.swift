import UIKit

/*
 Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
 In Pascal's triangle, each number is the sum of the two numbers directly above it.

 Example:
 Input: 5
 Output:
 [
      [1],
     [1,1],
    [1,2,1],
   [1,3,3,1],
  [1,4,6,4,1]
 ]
 */

/// answer1
func generate1(_ numRows: Int) -> [[Int]] {
    var result = [[Int]]()
    
    for i in 0..<numRows {
        var nums = [1]
        
        /// ignore first
        if i != 0 {
            let prev = result[i-1]
            
            for k in 0..<prev.count-1 {
                nums.append(prev[k]+prev[k+1])
            }
            nums.append(1)
        }
        result.append(nums)
    }
    
    return result
}

/// answer2 ( 1の改良 )
func generate2(_ numRows: Int) -> [[Int]] {
    var result = [[Int]]()
    
    for i in 0..<numRows {
        result.append([1])
        
        /// ignore first
        guard i != 0 else { continue }
        
        let prev = result[i-1]

        for k in 0..<prev.count-1 {
            result[i].append(prev[k]+prev[k+1])
        }
        result[i].append(1)
    }
    
    return result
}

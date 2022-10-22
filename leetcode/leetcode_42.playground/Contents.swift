import UIKit

/*
 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.
 
 Example 1:
 Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6
 Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
 
 Example 2:
 Input: height = [4,2,0,3,2,5]
 Output: 9
  
 Constraints:
 n == height.length
 1 <= n <= 2 * 104
 0 <= height[i] <= 105
 */

// timeout
func trap(_ height: [Int]) -> Int {
    var result = 0
    var lines = height
    
    while !lines.isEmpty {
        guard lines[0] != 0 else {
            lines.removeFirst()
            continue
        }
        
        var counter = 0
        
        for i in 0..<lines.count {
            if 0 < lines[i] {
                lines[i] -= 1
                result += counter
                counter = 0
            } else {
                counter += 1
            }
        }
    }
    
    return result
}

// easy solution from discuss
func trap2(_ height: [Int]) -> Int {
    var ans = 0
    
    for i in 0..<height.count {
        var leftMax = 0
        var rightMax = 0
        
        for index in 0...i {
            leftMax = max(leftMax, height[index])
        }
        for index in i..<height.count {
            rightMax = max(rightMax, height[index])
        }
        
        ans += min(leftMax, rightMax) - height[i]
    }
    
    return ans
}

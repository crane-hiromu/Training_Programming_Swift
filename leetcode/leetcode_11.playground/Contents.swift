import UIKit

/*
 Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

 Note: You may not slant the container and n is at least 2.
 */

/// answer(linear search O(n^2))
func maxArea(_ height: [Int]) -> Int {
    let count = height.count-1
    var result = 0
    
    /// 先頭から順番に上げていく
    for i in (0...count) {
        let start = height[i]
        var length = count
        
        /// 後ろから狭めていく
        while i < length {
            let end = height[length]

            let h = (start < end) ? start : end
            let w = (length - i)
            let area = h * w

            if result < area {
                result = area
            }
            length -= 1
        }
    }
    return result
}

/// answer(two pointer O(n))
func maxArea2(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count - 1
    var result = 0
    
    while left < right {
        let numL = height[left]
        let numR = height[right]
        
        let h = min(numL, numR)
        let w = right - left
        let area = h*w
        result = max(result, area)
        
        if numL < numR {
            left += 1
        } else {
            right -= 1
        }
    }
    
    return result
}

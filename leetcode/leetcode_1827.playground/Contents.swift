import UIKit

/*
 You are given an integer array nums (0-indexed). In one operation, you can choose an element of the array and increment it by 1.

 For example, if nums = [1,2,3], you can choose to increment nums[1] to make nums = [1,3,3].
 Return the minimum number of operations needed to make nums strictly increasing.

 An array nums is strictly increasing if nums[i] < nums[i+1] for all 0 <= i < nums.length - 1. An array of length 1 is trivially strictly increasing.

 Example 1:
 Input: nums = [1,1,1]
 Output: 3
 Explanation: You can do the following operations:
 1) Increment nums[2], so nums becomes [1,1,2].
 2) Increment nums[1], so nums becomes [1,2,2].
 3) Increment nums[2], so nums becomes [1,2,3].
 
 Example 2:
 Input: nums = [1,5,2,4,1]
 Output: 14
 
 Example 3:
 Input: nums = [8]
 Output: 0
  
 Constraints:
 1 <= nums.length <= 5000
 1 <= nums[i] <= 104
 */

// answer1 (Time Limit Exceeded)
func minOperations1(_ nums: [Int]) -> Int {
    guard 1 < nums.count else { return 0 }
    
    var nums = nums, index = 0, counter = 0
    
    while index < nums.count-1 {
        if nums[index+1] <= nums[index] {
            nums[index+1] += 1
            counter += 1
        } else {
            index += 1
        }
    }

    return counter
}

// answer2
func minOperations2(_ nums: [Int]) -> Int {
    guard 1 < nums.count else { return 0 }
    
    var nums = nums, index = 0, counter = 0
    
    while index < nums.count-1 {
        let current = nums[index], next = nums[index+1]
        
        if next <= current {
            let diff = (current - next + 1)
            nums[index+1] += diff
            counter += diff
        }
        index += 1
    }

    return counter
}

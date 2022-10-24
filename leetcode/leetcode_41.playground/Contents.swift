import UIKit

/*
 Given an unsorted integer array nums, return the smallest missing positive integer.
 You must implement an algorithm that runs in O(n) time and uses constant extra space.

 Example 1:
 Input: nums = [1,2,0]
 Output: 3
 Explanation: The numbers in the range [1,2] are all in the array.
 
 Example 2:
 Input: nums = [3,4,-1,1]
 Output: 2
 Explanation: 1 is in the array but 2 is missing.
 
 Example 3:
 Input: nums = [7,8,9,11,12]
 Output: 1
 Explanation: The smallest positive integer 1 is missing.
  
 Constraints:
 1 <= nums.length <= 105
 -231 <= nums[i] <= 231 - 1
 */

func firstMissingPositive(_ nums: [Int]) -> Int {
    let uniqueNums = Set(nums)
    var dict = [Int: Int]()
    
    for num in uniqueNums where 0 < num {
        dict[num] = 1
    }
    
    for i in 1...uniqueNums.count {
        if dict[i] == nil {
            return i
        }
    }
    
    return uniqueNums.count + (uniqueNums.contains(0) ? 0 : 1)
}

// easy - solution
func firstMissingPositive2(_ nums: [Int]) -> Int {
    let set = Set(nums)
    
    for i in 0..<set.count where !set.contains(i + 1) {
        return i + 1
    }
    
    return set.count + 1
}

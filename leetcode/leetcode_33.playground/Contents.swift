import UIKit

/*
 You are given an integer array nums sorted in ascending order, and an integer target.
 Suppose that nums is rotated at some pivot unknown to you beforehand (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

 If target is found in the array return its index, otherwise, return -1.

 Example 1:
 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 
 Example 2:
 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 
 Example 3:
 Input: nums = [1], target = 0
 Output: -1
  
 Constraints:
 1 <= nums.length <= 5000
 -10^4 <= nums[i] <= 10^4
 All values of nums are unique.
 nums is guranteed to be rotated at some pivot.
 -10^4 <= target <= 10^4
 */

/// answer1 (easy way)
func search1(_ nums: [Int], _ target: Int) -> Int {
    for i in 0..<nums.count {
        if nums[i] == target {
            return i
        }
    }
    return -1
}

/// answer2 (1 linear )
func search2(_ nums: [Int], _ target: Int) -> Int {
    return nums.firstIndex(where: {$0 == target}) ?? -1
}

/// answer3 ( binary search)
func search(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let mid = (left+right)/2
        
        guard nums[mid] != target else { return mid }
        
        /// 左が単調増加
        if nums[left] <= nums[mid] {
            /// targetが範囲内にあるかどうか
            if nums[left] <= target && target < nums[mid] {
                right = mid-1
            } else {
                left = mid+1
            }
         
        /// 右が単調増加
        } else {
            /// targetが範囲内にあるかどうか
            if nums[mid] < target && target <= nums[right] {
                left = mid+1
            } else {
                right = mid-1
            }
        }
    }
    
    return -1
}

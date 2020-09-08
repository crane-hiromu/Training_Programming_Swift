import UIKit

/*
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

 (i.e., [0,0,1,2,2,5,6] might become [2,5,6,0,0,1,2]).

 You are given a target value to search. If found in the array return true, otherwise return false.

 Example 1:
 Input: nums = [2,5,6,0,0,1,2], target = 0
 Output: true
 
 Example 2:
 Input: nums = [2,5,6,0,0,1,2], target = 3
 Output: false
 
 Follow up:
 This is a follow up problem to Search in Rotated Sorted Array, where nums may contain duplicates.
 Would this affect the run-time complexity? How and why?
 */

/// answer1
func search1(_ nums: [Int], _ target: Int) -> Bool {
    for num in nums {
        if num == target {
            return true
        }
    }
    return false
}

/// asnwer2 ( from discuss - binary search )
func search(_ nums: [Int], _ target: Int) -> Bool {
    var left = 0, right = nums.count-1
    
    while left <= right {
        let mid = (left+right)/2
        
        guard nums[mid] != target  else { return true }
        
        /// 左が単調増加
        if nums[left] < nums[mid] {
            /// 範囲内にあるかどうか
            if nums[left] <= target && target <= nums[mid] {
                right = mid-1
            } else {
                left = mid+1
            }
        
        /// 右が単調増加
        } else if nums[mid] < nums[left] {
            /// 範囲内にあるかどうか
            if nums[mid] <= target && target <= nums[right] {
                left = mid+1
            } else {
                right = mid-1
            }
        
        /// 同じ数字の場合を考慮する
        } else {
            left += 1
        }
    }
    
    return false
}

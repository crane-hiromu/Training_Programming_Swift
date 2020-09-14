import UIKit

/*
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 (i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).

 Find the minimum element.
 You may assume no duplicate exists in the array.

 Example 1:
 Input: [3,4,5,1,2]
 Output: 1
 
 Example 2:
 Input: [4,5,6,7,0,1,2]
 Output: 0
 */

/// answer1 ( binary search )
func findMin1(_ nums: [Int]) -> Int {
    var left = 0, right = nums.count-1
    
    /// 「１桁」と「単調増加」の場合は除く
    guard nums[right] < nums[left] else { return nums[0] }
    
    while left <= right {
        let mid = (left+right)/2
        
        if nums[left] <= nums[mid] {
            guard nums[mid] <= nums[mid+1] else { return nums[mid+1] }
            left = mid+1
            
        } else {
            guard nums[mid-1] <= nums[mid] else { return nums[mid] }
            right = mid-1
        }
    }

    return nums[right]
}

/// answer2 ( binary search - more simple code )
func findMin2(_ nums: [Int]) -> Int {
    var left = 0, right = nums.count-1
    
    while left < right {
        let middle = (left + right)/2
        
        if nums[middle] < nums[right] {
            right = middle
        } else {
            left = middle + 1
        }
    }
    return nums[left]
}

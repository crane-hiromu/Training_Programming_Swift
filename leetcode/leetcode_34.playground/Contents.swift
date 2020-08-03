import UIKit

/*
 Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
 Your algorithm's runtime complexity must be in the order of O(log n).
 If the target is not found in the array, return [-1, -1].

 Example 1:
 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 
 Example 2:
 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]
 */

/// answer1 ( Linear Scan - O(n) )
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    guard !nums.isEmpty else { return [-1, -1] }
    
    /// 最初を見つける ( O(k) )
    var firstCounter = 0
    for i in nums {
        if i == target { break }
        firstCounter += 1
        
        if i == nums.last {
            return [-1, -1]
        }
    }
    
    /// 後ろを見つける ( O(n-k) )
    let count = nums.count
    var newNums = nums
    newNums.reverse()
    var lastCounter = 0
    for i in (0..<count-firstCounter) {
        if newNums[i] == target { break }
        lastCounter += 1
    }
    
    return [firstCounter, count-1-lastCounter]
}

/// answer2 ( Binary Search from solution - O(logn) )


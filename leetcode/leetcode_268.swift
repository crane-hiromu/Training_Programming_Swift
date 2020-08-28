//
//  leetcode_268.swift
//  
//
//  Created by h.crane on 2020/08/28.
//

import Foundation

/*
 Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.

 Example 1:
 Input: [3,0,1]
 Output: 2
 
 Example 2:
 Input: [9,6,4,2,3,5,7,0,1]
 Output: 8
 
 Note:
 Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?
 */

/// failed answer ( time out )
func missingNumber1(_ nums: [Int]) -> Int {
    for i in 0...nums.count {
        if !nums.contains(i) {
            return i
        }
        if !nums.contains(nums.count-i) {
            return nums.count-i
        }
    }
    return 0
}

/// answer2 ( from discuss )
func missingNumber2(_ nums: [Int]) -> Int {
    let sortedNum = nums.sorted()
    for (index, num) in sortedNum.enumerated() {
        if index != num {
            return index
        }
    }
    return nums.count
}

// answer3 (with discuss - binary search )
func missingNumber3(_ nums: [Int]) -> Int {
    guard 1 < nums.count else { return nums.first == 0 ? 1 : 0 }
    
    let sortedNums = nums.sorted()
    
    var left = 0
    var right = sortedNums.count
    
    while left < right {
        let mid = (right - left) / 2 + left
        
        if mid < sortedNums[mid] {
            right = mid
        } else {
            left = mid + 1
        }
    }
    
    return left
}

/// answer4 ( from discuss )
func missingNumber4(_ nums: [Int]) -> Int {
    var expectedSum = nums.count
    var sum = 0
    for i in 0..<nums.count{
        sum += nums[i]
        expectedSum += i
    }
    
    return expectedSum - sum
}

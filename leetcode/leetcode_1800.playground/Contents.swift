import UIKit

/*
 Given an array of positive integers nums, return the maximum possible sum of an ascending subarray in nums.
 A subarray is defined as a contiguous sequence of numbers in an array.
 A subarray [numsl, numsl+1, ..., numsr-1, numsr] is ascending if for all i where l <= i < r, numsi < numsi+1. Note that a subarray of size 1 is ascending.

 Example 1:
 Input: nums = [10,20,30,5,10,50]
 Output: 65
 Explanation: [5,10,50] is the ascending subarray with the maximum sum of 65.
 
 Example 2:
 Input: nums = [10,20,30,40,50]
 Output: 150
 Explanation: [10,20,30,40,50] is the ascending subarray with the maximum sum of 150.
 
 Example 3:
 Input: nums = [12,17,15,13,10,11,12]
 Output: 33
 Explanation: [10,11,12] is the ascending subarray with the maximum sum of 33.
 
 Example 4:
 Input: nums = [100,10,1]
 Output: 100

 */

// answer1 linear search
func maxAscendingSum1(_ nums: [Int]) -> Int {
    var sum = 0, last = 0, result = 0
    
    for num in nums {
        sum = num + (last < num ? sum : 0)
        result = max(result, sum)
        last = num
    }
    
    // 最後の追加処理が実行されないので、ここで判定
    return result < sum ? sum : result
}

// answer2 two pointer
func maxAscendingSum2(_ nums: [Int]) -> Int {
    // ignore one num
    guard 1 < nums.count else { return nums.first ?? 0 }
    
    var sum1 = nums[0], sum2 = nums[nums.count-1], result1 = sum1, result2 = sum2
    
    for i in (0..<nums.count) {
        let diff = nums.count-1-2*i
        
        if diff == 0 {
            return (nums[i] < nums[i+1]) ? max(result1, result2, sum1+sum2-nums[i]) : max(result1, result2)
        } else if diff == 1 {
            return (nums[i] < nums[i+1]) ? max(result1, result2, sum1+sum2) : max(result1, result2, sum1, sum2)
        }

        sum1 = nums[i+1] + (nums[i] < nums[i+1] ? sum1 : 0)
        result1 = max(result1, sum1)
        
        sum2 = nums[nums.count-2-i] + (nums[nums.count-2-i] < nums[nums.count-1-i] ? sum2 : 0)
        result2 = max(result2, sum2)
    }
    return max(result1, result2)
}

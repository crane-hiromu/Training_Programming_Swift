import UIKit

/*
 You are given an integer array nums. The unique elements of an array are the elements that appear exactly once in the array.
 Return the sum of all the unique elements of nums.

 Example 1:
 Input: nums = [1,2,3,2]
 Output: 4
 Explanation: The unique elements are [1,3], and the sum is 4.
 
 Example 2:
 Input: nums = [1,1,1,1,1]
 Output: 0
 Explanation: There are no unique elements, and the sum is 0.
 
 Example 3:
 Input: nums = [1,2,3,4,5]
 Output: 15
 Explanation: The unique elements are [1,2,3,4,5], and the sum is 15.
  
 Constraints:
 1 <= nums.length <= 100
 1 <= nums[i] <= 100
 */

func sumOfUnique(_ nums: [Int]) -> Int {
    return nums
        .reduce(into: [Int: Int](), { $0[$1, default: Int(0)] += 1 })
        .filter { $0.value == 1 }
        .map { $0.key }
        .reduce(0, +)
}

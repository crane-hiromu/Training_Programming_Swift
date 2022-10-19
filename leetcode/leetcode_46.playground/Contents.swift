import UIKit

/*
 Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

 Example 1:
 Input: nums = [1,2,3]
 Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 
 Example 2:
 Input: nums = [0,1]
 Output: [[0,1],[1,0]]
 
 Example 3:
 Input: nums = [1]
 Output: [[1]]
 */

func permute(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    backtrack(nums: nums, current: [], result: &result)
    return result
}

func backtrack(nums: [Int], current: [Int], result: inout [[Int]]) {
    if nums.count == current.count {
        result.append(current)
        return
    }
    
    for i in 0..<nums.count where !current.contains(nums[i]) {
        backtrack(nums: nums, current: current + [nums[i]], result: &result)
    }
}

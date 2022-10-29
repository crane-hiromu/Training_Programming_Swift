import UIKit

/*
 Given an integer array nums of unique elements, return all possible subsets (the power set).
 The solution set must not contain duplicate subsets. Return the solution in any order.

 Example 1:
 Input: nums = [1,2,3]
 Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

 Example 2:
 Input: nums = [0]
 Output: [[],[0]]
  
 Constraints:
 1 <= nums.length <= 10
 -10 <= nums[i] <= 10
 All the numbers of nums are unique.
 */

/* example 1
 []
 |           \       \
 [1]          [2]    [3]
 |            |
 [1,2] [1,3]  [2,3]
 |
 [1,2,3]
 */

func subsets(_ nums: [Int]) -> [[Int]] {
    guard !nums.isEmpty else { return [[]] }
    
    var result = [[Int]]()
    backtrack(start: 0, current: [], nums: nums, result: &result)
    return result
}

func backtrack(start: Int, current: [Int], nums: [Int], result: inout [[Int]]) {
    result.append(current)
    
    var updated = current

    for i in start..<nums.count {
        updated.append(nums[i])
        backtrack(start: i+1, current: updated, nums: nums, result: &result)
        updated.removeLast()
    }
}

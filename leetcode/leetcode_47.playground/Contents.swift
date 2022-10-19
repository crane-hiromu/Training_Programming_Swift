import UIKit

/*
 Given a collection of numbers, nums, that might contain duplicates, return all possible unique permutations in any order.

 Example 1:
 Input: nums = [1,1,2]
 Output:
 [[1,1,2],
  [1,2,1],
  [2,1,1]]
 
 Example 2:
 Input: nums = [1,2,3]
 Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 */

func permuteUnique(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var dict = [Int: Int]()
    for num in nums {
        dict[num, default: 0] += 1
    }
    backtrack(nums: nums, current: [], dict: dict, result: &result)
    return Array(Set(result))
}

func backtrack(nums: [Int], current: [Int], dict: [Int: Int], result: inout [[Int]]) {
    if nums.count == current.count {
        result.append(current)
        return
    }
    
    var remains = dict
    
    for i in 0..<nums.count where 0 < remains[nums[i]]! {
        remains[nums[i], default: 0] -= 1
        backtrack(nums: nums, current: current + [nums[i]], dict: remains, result: &result)
        remains[nums[i], default: 0] += 1
    }
}

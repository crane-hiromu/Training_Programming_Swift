import UIKit

/*
 Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target.
 Each number in candidates may only be used once in the combination.
 Note: The solution set must not contain duplicate combinations.

 Example 1:
 Input: candidates = [10,1,2,7,6,1,5], target = 8
 Output:
 [
 [1,1,6],
 [1,2,5],
 [1,7],
 [2,6]
 ]
 
 Example 2:
 Input: candidates = [2,5,2,1,2], target = 5
 Output:
 [
 [1,2,2],
 [5]
 ]

 Constraints:
 1 <= candidates.length <= 100
 1 <= candidates[i] <= 50
 1 <= target <= 30
 */

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var result = [[Int]]()
    backtrack(nums: [],
              start: 0,
              candidates: candidates.sorted(),
              target: target,
              result: &result)
    return Array(Set(result))
}

func backtrack(nums: [Int], start: Int, candidates: [Int], target: Int, result: inout [[Int]]) {
    let sum = nums.reduce(0, +)
    
    if sum == target {
        result.append(nums)
        return
    } else if target < sum {
        return
    }
    
    var newNums = nums
    
    for i in start..<candidates.count {
        if i != start && candidates[i] == candidates[i-1] { continue } // skip the same num been used
        
        newNums.append(candidates[i])
        backtrack(nums: newNums,
                  start: i+1,
                  candidates: candidates,
                  target: target,
                  result: &result)
        newNums.removeLast()
    }
}

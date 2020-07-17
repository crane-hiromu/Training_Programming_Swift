import UIKit

/*
 Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.

 Example 1:
 Input: nums = [-1,2,1,-4], target = 1
 Output: 2
 Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
  
 Constraints:
 3 <= nums.length <= 10^3
 -10^3 <= nums[i] <= 10^3
 -10^4 <= target <= 10^4
 */

// answer( linear search * two pointer )
func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    let sortedNums = nums.sorted()
    var result = 0
    var diff = 0

    for (index, num) in sortedNums.enumerated() {
        var newNums = sortedNums
        newNums.remove(at: index)

        var left = 0
        var right = newNums.count-1

        while left < right {
            let sum = num + newNums[left] + newNums[right]

            if sum == target {
                return target
            } else if sum < target {
                left += 1
            } else if target < sum {
                right -= 1
            }

            guard diff == 0 || abs(target-sum) < diff else { continue }
            diff = abs(target-sum)
            result = sum
        }
    }
    return result
}

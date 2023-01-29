import UIKit

/*
 You are given a 0-indexed integer array nums and a target element target.
 A target index is an index i such that nums[i] == target.
 Return a list of the target indices of nums after sorting nums in non-decreasing order. If there are no target indices, return an empty list. The returned list must be sorted in increasing order.

 Example 1:
 Input: nums = [1,2,5,2,3], target = 2
 Output: [1,2]
 Explanation: After sorting, nums is [1,2,2,3,5].
 The indices where nums[i] == 2 are 1 and 2.
 
 Example 2:
 Input: nums = [1,2,5,2,3], target = 3
 Output: [3]
 Explanation: After sorting, nums is [1,2,2,3,5].
 The index where nums[i] == 3 is 3.
 
 Example 3:
 Input: nums = [1,2,5,2,3], target = 5
 Output: [4]
 Explanation: After sorting, nums is [1,2,2,3,5].
 The index where nums[i] == 5 is 4.
  
 Constraints:
 1 <= nums.length <= 100
 1 <= nums[i], target <= 100
 */

class Solution {
    func targetIndices(_ nums: [Int], _ target: Int) -> [Int] {
        let sortedNums = quickSort(nums)
        print(sortedNums)
        var result = [Int]()

        for i in 0..<nums.count where sortedNums[i] == target {
            result.append(i)
        }
        return result
    }

    func quickSort(_ nums: [Int]) -> [Int] {
        guard 1 < nums.count else { return nums }

        let pivot = nums[nums.count/2]
        let less = nums.filter { $0 < pivot }
        let equal = nums.filter { $0 == pivot }
        let greater = nums.filter { pivot < $0 }

        return quickSort(less) + equal + quickSort(greater)
    }

    func bubbleSort(_ nums: [Int]) -> [Int] {
        var result = nums
        var isSwapped = true

        while isSwapped {
            isSwapped = false

            for i in 0..<result.count-1 where result[i] > result[i+1] {
                result.swapAt(i, i+1)
                isSwapped = true
            }
        }
        return result
    }
}

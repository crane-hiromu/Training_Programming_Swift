import UIKit

/*
 Given the array nums, obtain a subsequence of the array whose sum of elements is strictly greater than the sum of the non included elements in such subsequence.

 If there are multiple solutions, return the subsequence with minimum size and if there still exist multiple solutions, return the subsequence with the maximum total sum of all its elements. A subsequence of an array can be obtained by erasing some (possibly zero) elements from the array.

 Note that the solution with the given constraints is guaranteed to be unique. Also return the answer sorted in non-increasing order.

 Example 1:
 Input: nums = [4,3,10,9,8]
 Output: [10,9]
 Explanation: The subsequences [10,9] and [10,8] are minimal such that the sum of their elements is strictly greater than the sum of elements not included. However, the subsequence [10,9] has the maximum total sum of its elements.
 
 Example 2:
 Input: nums = [4,4,7,6,7]
 Output: [7,7,6]
 Explanation: The subsequence [7,7] has the sum of its elements equal to 14 which is not strictly greater than the sum of elements not included (14 = 4 + 4 + 6). Therefore, the subsequence [7,6,7] is the minimal satisfying the conditions. Note the subsequence has to be returned in non-decreasing order.
  
 Constraints:
 1 <= nums.length <= 500
 1 <= nums[i] <= 100
 */

class Solution {
    func minSubsequence(_ nums: [Int]) -> [Int] {
        let sortedNums = quickSort(nums)
        var array1 = [Int](), array2 = sortedNums

        for num in sortedNums {
            array1.append(num)
            array2.removeFirst()

            if array2.reduce(0, +) < array1.reduce(0, +) {
                return array1
            }
        }

        return []
    }

    func quickSort(_ nums: [Int]) -> [Int] {
        guard 1 < nums.count else { return nums }

        let pivot = nums[nums.count/2]
        let less = nums.filter { $0 < pivot }
        let equal = nums.filter { $0 == pivot }
        let greater = nums.filter { pivot < $0 }

        return quickSort(greater) + equal + quickSort(less)
    }
}

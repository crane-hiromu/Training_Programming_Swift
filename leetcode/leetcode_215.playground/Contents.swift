import UIKit

/*
 Given an integer array nums and an integer k, return the kth largest element in the array.
 Note that it is the kth largest element in the sorted order, not the kth distinct element.
 You must solve it in O(n) time complexity.

 Example 1:
 Input: nums = [3,2,1,5,6,4], k = 2
 Output: 5
 
 Example 2:
 Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
 Output: 4
  
 Constraints:
 1 <= k <= nums.length <= 105
 -104 <= nums[i] <= 104
 */

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var dict = [Int: Int]()
        nums.forEach { dict[$0, default: 0] += 1 }

        let array = quickSort(nums)
        var counter = k
        
        for num in array {
            dict[num, default: 0] -= 1
            if dict[num] == 0 { dict[num] = nil }

            counter -= 1
            if counter == 0 { return num }
        }
        return 0
    }

    func quickSort(_ nums: [Int]) ->[Int] {
        guard 1 < nums.count else { return nums }

        let pivot = nums[nums.count/2]
        let less = nums.filter { $0 < pivot }
        let equal = nums.filter { $0 == pivot }
        let greater = nums.filter { $0 > pivot }

        return quickSort(greater) + equal + quickSort(less)
    }
}

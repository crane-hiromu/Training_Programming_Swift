import UIKit

/*
 Given two 0-indexed integer arrays nums1 and nums2, return a list answer of size 2 where:
 answer[0] is a list of all distinct integers in nums1 which are not present in nums2.
 answer[1] is a list of all distinct integers in nums2 which are not present in nums1.
 Note that the integers in the lists may be returned in any order.

 Example 1:
 Input: nums1 = [1,2,3], nums2 = [2,4,6]
 Output: [[1,3],[4,6]]
 Explanation:
 For nums1, nums1[1] = 2 is present at index 0 of nums2, whereas nums1[0] = 1 and nums1[2] = 3 are not present in nums2. Therefore, answer[0] = [1,3].
 For nums2, nums2[0] = 2 is present at index 1 of nums1, whereas nums2[1] = 4 and nums2[2] = 6 are not present in nums2. Therefore, answer[1] = [4,6].
 
 Example 2:\
 Input: nums1 = [1,2,3,3], nums2 = [1,1,2,2]
 Output: [[3],[]]
 Explanation:
 For nums1, nums1[2] and nums1[3] are not present in nums2. Since nums1[2] == nums1[3], their value is only included once and answer[0] = [3].
 Every integer in nums2 is present in nums1. Therefore, answer[1] = [].
  
 Constraints:
 1 <= nums1.length, nums2.length <= 1000
 -1000 <= nums1[i], nums2[i] <= 1000
 */

class Solution {
    func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
        var result = [[Int]]()
        result.append(diff(nums1, nums2))
        result.append(diff(nums2, nums1))
        return result
    }

    func diff(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var temp = [Int]()

        for n1 in Set(nums1) where nums2.contains(n1) {
            for n1_2 in Set(nums1) where !nums2.contains(n1_2) && n1 != n1_2 {
                temp.append(n1_2)
            }
            return temp
        }
        return temp.isEmpty ? Array(Set(nums1)) : temp
    }
}

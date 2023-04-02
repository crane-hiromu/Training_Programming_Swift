/*
 Given two arrays of unique digits nums1 and nums2, return the smallest number that contains at least one digit from each array.
  
 Example 1:
 Input: nums1 = [4,1,3], nums2 = [5,7]
 Output: 15
 Explanation: The number 15 contains the digit 1 from nums1 and the digit 5 from nums2. It can be proven that 15 is the smallest number we can have.
 
 Example 2:
 Input: nums1 = [3,5,2,6], nums2 = [3,1,7]
 Output: 3
 Explanation: The number 3 contains the digit 3 which exists in both arrays.
  
 Constraints:
 1 <= nums1.length, nums2.length <= 9
 1 <= nums1[i], nums2[i] <= 9
 All digits in each array are unique.
 */

class Solution {
    func minNumber(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var m1 = Int.max, m2 = Int.max, same = Int.max

        for n1 in nums1 {
            m1 = min(m1, n1)

            if nums2.contains(n1) {
                same = min(same, n1)
            }
         }

        guard same == Int.max else { return same }
        
        for n2 in nums2 {
            m2 = min(m2, n2)
        }

        return m1 < m2 ? m1*10+m2 : m2*10+m1
    }
}

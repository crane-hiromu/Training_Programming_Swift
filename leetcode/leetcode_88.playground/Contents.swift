import UIKit

/*
 Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

 Note:
 The number of elements initialized in nums1 and nums2 are m and n respectively.
 You may assume that nums1 has enough space (size that is equal to m + n) to hold additional elements from nums2.
 
 Example:
 Input:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3
 Output: [1,2,2,3,5,6]

 Constraints:
 -10^9 <= nums1[i], nums2[i] <= 10^9
 nums1.length == m + n
 nums2.length == n
 */

/// answer1
func merge1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    nums1 = (nums1[0..<m]+nums2[0..<n]).sorted()
}

/// answer2 ( merge sort )
func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var left = Array(nums1[..<m])
    var right = Array(nums2[..<n])
    var result = [Int]()
    
    while 0 < left.count && 0 < right.count {
        if left[0] <= right[0] {
            result.append(left.removeFirst())
        } else {
            result.append(right.removeFirst())
        }
    }
    
    result.append(contentsOf: right)
    result.append(contentsOf: left)
    
    nums1 = result
}

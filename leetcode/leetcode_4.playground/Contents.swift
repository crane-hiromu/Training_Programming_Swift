import UIKit

/*
 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 You may assume nums1 and nums2 cannot be both empty.

 Example 1:
 nums1 = [1, 3]
 nums2 = [2]
 The median is 2.0
 
 Example 2:
 nums1 = [1, 2]
 nums2 = [3, 4]
 The median is (2 + 3)/2 = 2.5
 */

/// answer1
func findMedianSortedArrays1(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let sum = (nums1+nums2).sorted()
    let count = sum.count
    let mid = count/2
    
    if count % 2 == 0 {
        return (Double(sum[mid]) + Double(sum[mid-1])) / 2.0
    } else {
        return Double(sum[mid])
    }
}

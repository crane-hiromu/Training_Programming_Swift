import UIKit

/*
 Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.

 Example 1:
 Input: nums1 = [1,2,2,1], nums2 = [2,2]
 Output: [2,2]
 
 Example 2:
 Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 Output: [4,9]
 Explanation: [9,4] is also accepted.
  
 Constraints:
 1 <= nums1.length, nums2.length <= 1000
 0 <= nums1[i], nums2[i] <= 1000
  
 Follow up:
 What if the given array is already sorted? How would you optimize your algorithm?
 What if nums1's size is small compared to nums2's size? Which algorithm is better?
 What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
 */

// merge sort + binary search
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let sortedNums1 = mergeSort(nums1), sortedNums2 = mergeSort(nums2)
    
    // 計算量を減らすため、短い方で数字を回すようにする
    var numsComb: (long: [Int], sort: [Int]) = {
        if sortedNums1.count < sortedNums2.count {
            return (long: sortedNums2, sort: sortedNums1)
        } else {
            return (long: sortedNums1, sort: sortedNums2)
        }
    }()
    
    var result = [Int]()
    for num in numsComb.sort {
        let index = binarySearch(nums: numsComb.long, target: num)
        
        if -1 < index {
            result.append(numsComb.long[index])
            numsComb.long.remove(at: index)
        }
    }
    
    return result
}

func binarySearch(nums: [Int], target: Int) -> Int {
    var left = 0, right = nums.count - 1
    
    while left <= right {
        let mid = (left+right)/2
        
        guard nums[mid] != target else { return mid }
        
        if target <= nums[mid] {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return -1
}

func mergeSort(_ nums: [Int]) -> [Int] {
    guard 1 < nums.count else { return nums }
    
    let left = Array(nums[0..<Int(nums.count/2)])
    let right = Array(nums[Int(nums.count/2)..<nums.count])
    return mergeSort(left: mergeSort(left), right: mergeSort(right))
}

func mergeSort(left: [Int], right: [Int]) -> [Int] {
    var l = left, r = right, result = [Int]()
    
    while 0 < l.count && 0 < r.count {
        if l[0] < r[0] {
            result.append(l.removeFirst())
        } else {
            result.append(r.removeFirst())
        }
    }
    result.append(contentsOf: l)
    result.append(contentsOf: r)
    return result
}

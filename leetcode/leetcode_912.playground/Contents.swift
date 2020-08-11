import UIKit

/*
 Given an array of integers nums, sort the array in ascending order.
 
 Example 1:
 Input: nums = [5,2,3,1]
 Output: [1,2,3,5]
 
 Example 2:
 Input: nums = [5,1,1,2,0,0]
 Output: [0,0,1,1,2,5]
  
 Constraints:

 1 <= nums.length <= 50000
 -50000 <= nums[i] <= 50000
 */

/// failed answer ( bubble sort )
func sortArray1(_ nums: [Int]) -> [Int] {
    var flag = true, result = nums
    
    while flag {
        flag = false
        
        for i in (1..<result.count) {
            guard result[i] < result[i-1] else { continue }

            result.swapAt(i, i-1)
            flag = true
        }
    }
    return result
}

/// answer2 ( no algorithm )
func sortArray2(_ nums: [Int]) -> [Int] {
    return nums.sorted()
}

/// answer3 ( merge sort )
func sortArray3(_ nums: [Int]) -> [Int] {
    return mergeSort(nums)
}

func mergeSort(_ lists: [Int]) -> [Int] {
    guard 1 < lists.count else { return lists }
    
    let left = Array(lists[..<Int(lists.count/2)])
    let right = Array(lists[Int(lists.count/2)..<lists.count])
    return merge(left: mergeSort(left), right: mergeSort(right))
}

func merge(left: [Int], right: [Int]) -> [Int] {
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

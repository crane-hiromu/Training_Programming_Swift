import UIKit

/*
 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
 You may assume that the array is non-empty and the majority element always exist in the array.

 Example 1:
 Input: [3,2,3]
 Output: 3

 Example 2:
 Input: [2,2,1,1,1,2,2]
 Output: 2
 */

/// answer1 (linear serach)
func majorityElement(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    
    var counter: [Int: Int] = [:]
    
    nums.forEach {
        if let i = counter[$0] {
            counter[$0] = i+1
        } else {
            counter[$0] = 1
        }
    }

    return counter.sorted { $1.value < $0.value }[0].key
}

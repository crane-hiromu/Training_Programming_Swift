import UIKit

/*
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.

 Note:
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

 Example 1:
 Input: [2,2,1]
 Output: 1
 
 Example 2:
 Input: [4,1,2,1,2]
 Output: 4
 */

/// answer1 ( hash - O(n) )
func singleNumber1(_ nums: [Int]) -> Int {
    var counters = [Int: Int]()
    
    for num in nums {
        if let val = counters[num] {
            counters[num] = val + 1
        } else {
            counters[num] = 1
        }
    }
    
    return counters.filter { $0.value == 1 }.map { $0.key }.reduce(0, +)
}

/// answer2 ( from solution - Bit Manipulation )
func singleNumber(_ nums: [Int]) -> Int {
    var result = 0
    
    for i in 0..<nums.count {
        result ^= nums[i]
    }
    
    return result
}

/// answer3 ( from solution - Bit Manipulation - more swifty )
func singleNumber3(_ nums: [Int]) -> Int {
    return nums.reduce(0, ^)
}

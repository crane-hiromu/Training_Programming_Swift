import UIKit

/*
 Given a non-empty array of integers, every element appears three times except for one, which appears exactly once. Find that single one.
 Note:
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

 Example 1:
 Input: [2,2,3,2]
 Output: 3
 
 Example 2:
 Input: [0,1,0,1,0,1,99]
 Output: 99
 */

/// answer1
func singleNumber1(_ nums: [Int]) -> Int {
    var counters = [Int: Int]()
    
    for num in nums {
        if let val = counters[num] {
            counters[num] = val + 1
        } else {
            counters[num] = 1
        }
    }
    
    return counters.filter { $0.value == 1 }.first!.key
}

/// answer2  ( from discuss - single line)
func singleNumber2(_ nums: [Int]) -> Int {
    return Dictionary(grouping: nums, by: { $0 }).filter({ $0.value.count == 1 }).keys.first!
}

/// answer3 ( from discuss - single line)
func singleNumber3(_ nums: [Int]) -> Int {
    return nums.reduce(into: (Int(0), Int(0)), {
        $0.0 = ($0.0 ^ $1) & ~$0.1
        $0.1 = ($0.1 ^ $1) & ~$0.0
    }).0
}

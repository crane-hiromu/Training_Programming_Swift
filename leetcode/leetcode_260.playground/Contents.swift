import UIKit

/*
 Given an array of numbers nums, in which exactly two elements appear only once and all the other elements appear exactly twice. Find the two elements that appear only once.

 Example:
 Input:  [1,2,1,3,2,5]
 Output: [3,5]
 
 Note:
 The order of the result is not important. So in the above example, [5, 3] is also correct.
 Your algorithm should run in linear runtime complexity. Could you implement it using only constant space complexity?
 */

/// answer1
func singleNumber1(_ nums: [Int]) -> [Int] {
    var counters = [Int: Int]()
    
    for num in nums {
//        if let val = counters[num] {
//            counters[num] = val + 1
//        } else {
//            counters[num] = 1
//        }
        
        /// more simple
        counters[num, default: 0] += 1
    }
    
    return counters.filter { $0.value == 1 }.map { $0.key }
}

/// answer2 ( from discuss )
func singleNumber2(_ nums: [Int]) -> [Int] {
    return Array(Dictionary(nums.map{($0, 1)}, uniquingKeysWith: +).filter{$0.value == 1}.keys)
}

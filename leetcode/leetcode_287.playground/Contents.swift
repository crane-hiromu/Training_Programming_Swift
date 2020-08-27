import UIKit

/*
 Given an array nums containing n + 1 integers where each integer is between 1 and n (inclusive), prove that at least one duplicate number must exist. Assume that there is only one duplicate number, find the duplicate one.

 Example 1:
 Input: [1,3,4,2,2]
 Output: 2
 
 Example 2:
 Input: [3,1,3,4,2]
 Output: 3
 
 Note:
 You must not modify the array (assume the array is read only).
 You must use only constant, O(1) extra space.
 Your runtime complexity should be less than O(n2).
 There is only one duplicate number in the array, but it could be repeated more than once.
 */

/// answer1 ( set )
func findDuplicate1(_ nums: [Int]) -> Int {
    var numbers = Set<Int>()
    
    for num in nums {
        if numbers.contains(num) {
            return num
        } else {
            numbers.insert(num)
        }
    }
    return 0
}

/// answer2 ( sort )
func findDuplicate2(_ nums: [Int]) -> Int {
    let numbers = nums.sorted()
    
    for i in 1..<nums.count {
        if numbers[i] == numbers[i-1] {
            return numbers[i]
        }
    }
    return 0
}

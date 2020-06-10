import UIKit

/*
 Given an array nums and a value val, remove all instances of that value in-place and return the new length.
 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
 The order of elements can be changed. It doesn't matter what you leave beyond the new length.

 Example 1:

 Given nums = [3,2,2,3], val = 3,
 Your function should return length = 2, with the first two elements of nums being 2.
 It doesn't matter what you leave beyond the returned length.
 
 Example 2:
 Given nums = [0,1,2,2,3,0,4,2], val = 2,
 Your function should return length = 5, with the first five elements of nums containing 0, 1, 3, 0, and 4.
 Note that the order of those five elements can be arbitrary.
 It doesn't matter what values are set beyond the returned length.
 */

/// Answer
func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    nums = nums.filter { $0 != val }
    return nums.count
}


/// Answer2
func removeElement2(_ nums: inout [Int], _ val: Int) -> Int {
    var newNums = [Int]()
    
    while nums.count != 0 {
        if nums.first == val {
            nums.remove(at: 0)
        } else {
            newNums.append(nums.remove(at: 0))
        }
    }
    nums = newNums
    return nums.count
}

/// Answer3
func removeElement3(_ nums: inout [Int], _ val: Int) -> Int {
    for _ in (0..<nums.count) {
        if nums.first == val {
            nums.remove(at: 0)
        } else {
            nums.append(nums.remove(at: 0))
        }
    }
    return nums.count
}

/// Answer4
func removeElement4(_ nums: inout [Int], _ val: Int) -> Int {
    nums.forEach { _ in
        if nums.first == val {
            nums.remove(at: 0)
        } else {
            nums.append(nums.remove(at: 0))
        }
    }
    return nums.count
}


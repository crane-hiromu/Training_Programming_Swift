import UIKit

/*
 You are given a non-negative integer array nums. In one operation, you must:
 Choose a positive integer x such that x is less than or equal to the smallest non-zero element in nums.
 Subtract x from every positive element in nums.
 Return the minimum number of operations to make every element in nums equal to 0.

 Example 1:
 Input: nums = [1,5,0,3,5]
 Output: 3
 Explanation:
 In the first operation, choose x = 1. Now, nums = [0,4,0,2,4].
 In the second operation, choose x = 2. Now, nums = [0,2,0,0,2].
 In the third operation, choose x = 2. Now, nums = [0,0,0,0,0].
 
 Example 2:
 Input: nums = [0]
 Output: 0
 Explanation: Each element in nums is already 0 so no operations are needed.
  
 Constraints:
 1 <= nums.length <= 100
 0 <= nums[i] <= 100
 */

func minimumOperations(_ nums: [Int]) -> Int {
    var counter = 0
    operate(nums, counter: &counter)
    return counter
}

func operate(_ nums: [Int], counter: inout Int) {
    let minimum = nums.filter { $0 != 0 }.min()
    guard let minimum = minimum else { return }
    
    counter += 1
    
    var current = [Int]()
    
    for num in nums {
        let diff = num - minimum
        
        if 0 < diff {
            current.append(diff)
        }
    }
    
    if !current.isEmpty {
        operate(current, counter: &counter)
    }
}

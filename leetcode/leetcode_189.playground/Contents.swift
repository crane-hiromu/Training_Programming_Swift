import UIKit

/*
 Given an array, rotate the array to the right by k steps, where k is non-negative.

 Follow up:
 Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
 Could you do it in-place with O(1) extra space?
  
 Example 1:
 Input: nums = [1,2,3,4,5,6,7], k = 3
 Output: [5,6,7,1,2,3,4]
 
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 
 Example 2:
 Input: nums = [-1,-100,3,99], k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]
  
 Constraints:
 1 <= nums.length <= 2 * 10^4
 It's guaranteed that nums[i] fits in a 32 bit-signed integer.
 k >= 0
 */

/// answer1 ( simple way )
func rotate1(_ nums: inout [Int], _ k: Int) {
    for _ in (0..<k) {
        nums.insert(nums.removeLast(), at: 0)
    }
}

/// answer2 ( from discuss )
func rotate2(_ nums: inout [Int], _ k: Int) {
    if nums.count <= 0 { return }
    let kn = k % nums.count
    
    reverse(&nums, 0, nums.count-1)  // [1,2,3,4,5,6,7] -> [7,6,5,4,3,2,1]
    reverse(&nums, 0, kn-1)          // [7,6,5,4,3,2,1] -> [5,6,7,4,3,2,1]
    reverse(&nums, kn, nums.count-1) // [5,6,7,4,3,2,1] -> [5,6,7,1,2,3,4]
}

func reverse(_ nums: inout [Int], _ s: Int, _ e: Int) {
    var s = s; var e = e
    while s < e {
        nums.swapAt(s, e)
        s += 1
        e -= 1
    }
}

import UIKit

/*
 Given an array nums, return true if the array was originally sorted in non-decreasing order, then rotated some number of positions (including zero). Otherwise, return false.
 There may be duplicates in the original array.
 Note: An array A rotated by x positions results in an array B of the same length such that A[i] == B[(i+x) % A.length], where % is the modulo operation.

 Example 1:
 Input: nums = [3,4,5,1,2]
 Output: true
 Explanation: [1,2,3,4,5] is the original sorted array.
 You can rotate the array by x = 3 positions to begin on the the element of value 3: [3,4,5,1,2].
 
 Example 2:
 Input: nums = [2,1,3,4]
 Output: false
 Explanation: There is no sorted array once rotated that can make nums.
 
 Example 3:
 Input: nums = [1,2,3]
 Output: true
 Explanation: [1,2,3] is the original sorted array.
 You can rotate the array by x = 0 positions (i.e. no rotation) to make nums.
 
 Example 4:
 Input: nums = [1,1,1]
 Output: true
 Explanation: [1,1,1] is the original sorted array.
 You can rotate any number of positions to make nums.
 
 Example 5:
 Input: nums = [2,1]
 Output: true
 Explanation: [1,2] is the original sorted array.
 You can rotate the array by x = 5 positions to begin on the element of value 2: [2,1].
  
 Constraints:
 1 <= nums.length <= 100
 1 <= nums[i] <= 100
 */

// answer O(n)
func check(_ nums: [Int]) -> Bool {
    var hasRepeated = nums[0] < nums[nums.count-1]
    
    for i in (0..<nums.count-1) {
        if nums[i+1] < nums[i] {
            if hasRepeated { return false }
            hasRepeated = true
        }
    }
    return true
}

// answer O(n/2) テストケースが少ない？ためか速度は変わらず
func check2(_ nums: [Int]) -> Bool {
    var hasRepeated = nums[0] < nums[nums.count-1]
    
    for i in (0...nums.count/2) {
        let lead = i, trail = nums.count-1-i
        
        // center
        if trail <= lead { break }
        
        // 先頭の計算
        if nums[i+1] < nums[i] {
            if hasRepeated {
                return false
            }
            hasRepeated = true
        }
        
        // 奇数の時、真ん中の計算が重複しないように後半は除く
        if trail-lead == 1 { break }
        
        // 後半の計算
        if nums[trail] < nums[trail-1] {
            if hasRepeated {
                return false
            }
            hasRepeated = true
        }
    }
    return true
}

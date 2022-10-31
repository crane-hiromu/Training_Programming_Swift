/*
 Given an integer array nums that does not contain any zeros, find the largest positive integer k such that -k also exists in the array.
 Return the positive integer k. If there is no such integer, return -1.

 Example 1:
 Input: nums = [-1,2,-3,3]
 Output: 3
 Explanation: 3 is the only valid k we can find in the array.
 
 Example 2:
 Input: nums = [-1,10,6,7,-7,1]
 Output: 7
 Explanation: Both 1 and 7 have their corresponding negative values in the array. 7 has a larger value.
 
 Example 3:
 Input: nums = [-10,8,6,7,-2,-3]
 Output: -1
 Explanation: There is no a single valid k, we return -1.
  
 Constraints:
 1 <= nums.length <= 1000
 -1000 <= nums[i] <= 1000
 nums[i] != 0
 */

// O(n) solution
func findMaxK(_ nums: [Int]) -> Int {
    var result = -1
    var dict = [Int: Int]()
    
    for num in nums {
        dict[num, default: 0] += 1
        
        if let _ = dict[-num] {
            result = max(result, abs(num))
        }
    }
    
    return result
}

// more faster
func findMaxK2(_ nums: [Int]) -> Int {
    var result = -1
    var dict = [Int: Int]()
    
    for i in 0...nums.count/2 {
        let left = nums[i]
        let right = nums[nums.count-1-i]
        
        dict[left, default: 0] += 1
        dict[right, default: 0] += 1
        
        if let _ = dict[-left] {
            result = max(result, abs(left))
        }
        if let _ = dict[-right] {
            result = max(result, abs(right))
        }
    }
    return result
}

// two pointer
func findMaxK2(_ nums: [Int]) -> Int {
    let sortedNums = nums.sorted()
    var start = 0, end = nums.count-1
    
    while start < end {
        let left = sortedNums[start]
        let right = sortedNums[end]
        let sum = left + right
        
        if sum == 0 {
            return right
        }
        if sum < 0 {
            start += 1
        } else if 0 < sum {
            end -= 1
        }
    }
    
    return -1
}

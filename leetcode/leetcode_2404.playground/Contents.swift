/*
 Given an integer array nums, return the most frequent even element.
 If there is a tie, return the smallest one. If there is no such element, return -1.

 Example 1:
 Input: nums = [0,1,2,2,4,4,1]
 Output: 2
 Explanation:
 The even elements are 0, 2, and 4. Of these, 2 and 4 appear the most.
 We return the smallest one, which is 2.
 
 Example 2:
 Input: nums = [4,4,4,9,2,4]
 Output: 4
 Explanation: 4 is the even element appears the most.
 
 Example 3:
 Input: nums = [29,47,21,41,13,37,25,7]
 Output: -1
 Explanation: There is no even element.
  
 Constraints:
 1 <= nums.length <= 2000
 0 <= nums[i] <= 105
*/

func mostFrequentEven(_ nums: [Int]) -> Int {
    if nums.count == 1 {
        return nums[0].isMultiple(of: 2) ? nums[0] : -1
    }

    var dict = [Int: Int]()
    for num in nums {
        dict[num, default: 0] += 1
    }

    var result = -1, counter = 0
    for (key, value) in dict where key.isMultiple(of: 2) {
        if counter < value || counter == value && key < result {
            counter = value
            result = key
        }
    }
    
    return result
}

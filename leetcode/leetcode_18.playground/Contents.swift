/*
 Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:

 0 <= a, b, c, d < n
 a, b, c, and d are distinct.
 nums[a] + nums[b] + nums[c] + nums[d] == target
 You may return the answer in any order.

 Example 1:
 Input: nums = [1,0,-1,0,-2,2], target = 0
 Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 
 Example 2:
 Input: nums = [2,2,2,2,2], target = 8
 Output: [[2,2,2,2]]
  
 Constraints:
 1 <= nums.length <= 200
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 */

// broute force
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    var lastNums = Set<Int>()
    var result = [[Int]]()
    
    for i in 0..<nums.count {
        for j in i+1..<nums.count {
            for k in j+1..<nums.count {
                let diff = target - (nums[i] + nums[j] + nums[k])
                
                if lastNums.contains(diff) {
                    result.append([diff, nums[i], nums[j], nums[k]].sorted())
                }
            }
        }
        lastNums.insert(nums[i])
    }

    return Array(Set(result))
}

// two pointer
func fourSum_2(_ nums: [Int], _ target: Int) -> [[Int]] {
    let sortedNums = nums.sorted()
    let count = nums.count
    var result = [[Int]]()
    
    for i in 0..<count {
        for j in i+1..<count {
            var left = j+1
            var right = count-1
            let diff = target - sortedNums[i] - sortedNums[j]
            
            while left < right {
                if diff == sortedNums[left] + sortedNums[right] {
                    result.append([sortedNums[i], sortedNums[j], sortedNums[left], sortedNums[right]])
                    left += 1
                    right -= 1
                } else if diff < sortedNums[left] + sortedNums[right] {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
    }
    
    return Array(Set(result))
}

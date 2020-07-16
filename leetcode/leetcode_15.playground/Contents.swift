import UIKit

/*
 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

 Note:

 The solution set must not contain duplicate triplets.

 Example:

 Given array nums = [-1, 0, 1, 2, -1, -4],

 A solution set is:
 [
   [-1, 0, 1],
   [-1, -1, 2]
 ]
 */

/// answer(Timeout -  linear serach *  two pointer )
func threeSum1(_ nums: [Int]) -> [[Int]] {
    guard nums.count != 1 else { return [] }
    
    let sortedNums = nums.sorted()
    var result = [[Int]]()
    
    /// linear serach
    for (index, i) in sortedNums.enumerated() {
        var newNums = sortedNums
        newNums.remove(at: index)
        
        for k in (0...newNums.count-1) {
            var left = k
            var right = newNums.count-1

            /// two pointer
            while left < right {
                let lNum = newNums[left]
                let rNum = newNums[right]
                let sum = i + lNum + rNum

                if sum == 0 {
                    result.append([i, lNum, rNum].sorted())
                    break
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
    }
    return Array(Set(result))
}

/// answer2( linear serach *  two pointer )
func threeSum2(_ nums: [Int]) -> [[Int]] {
    guard 2 < nums.count else { return [] }
    
    let sortedNums = nums.sorted()
    var result = [[Int]]()
    
    for (index, i) in sortedNums.enumerated() {
        guard i < sortedNums.count-2 else { break }
        
        var newNums = sortedNums
        newNums.remove(at: index)
        
        var left = 0
        var right = newNums.count-1

        while left < right {
            let lNum = newNums[left]
            let rNum = newNums[right]
            let sum = i + lNum + rNum
            
            if sum == 0 {
                result.append([i, lNum, rNum].sorted())
                left += 1
                
                /// 次の数が同じ場合は処理が無駄なので先に進める
                while left < right && lNum == newNums[left+1] {
                    left += 1
                }
                
            } else if sum < 0 {
                left += 1
            } else {
                right -= 1
            }
        }
    }
    return Array(Set(result))
}

/// answer3(from discuss - linear serach *  two pointer )
func threeSum3(_ nums: [Int]) -> [[Int]] {
    
    guard nums.count > 2 else { return [] }
    
    let nums = nums.sorted()
    var result = [[Int]]()
    
    for i in 0...nums.count - 2 {
        
        // To avoid duplicates
        if i != 0 && nums[i] == nums[i - 1] {
            continue
        }
        
        var j = i + 1
        var k = nums.count - 1
        while j < k {
            let sum = nums[i] + nums[j] + nums[k]
            if sum == 0 {
                let array = [nums[i], nums[j], nums[k]]
                result.append(array)
                j += 1
                
                // To avoid duplicates
                while j < k && nums[j] == nums[j - 1] {
                    j += 1
                }
                
            } else if sum > 0 {
                k -= 1
            } else {
                j += 1
            }
        }
    }
    
    return result
}

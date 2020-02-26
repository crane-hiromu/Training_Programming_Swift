import UIKit

/// https://leetcode.com/problems/two-sum/

/// question
/// var nums = [2, 7, 11, 15], target = 9
/// print(twoSum(nums, target))

//normal
//24ms
func twoSum0(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0 ..< nums.count {
        var j = i+1
        
        while j < nums.count {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
            j += 1
        }
    }
    return []
}


// Quick
// 8ms
func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    var keyValue = [Int: Int]()
    
    for (i, num) in nums.enumerated() {
        if let index = keyValue[target-num] {
            return [i, index]
        }
        keyValue[num] = i
    }
    return []
}


// pointer
// 8ms
func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    var nNums = nums
    let nPointer = UnsafeMutablePointer<Int>(&nNums)
    
    for i in 0 ..< nums.count {
        var j = i+1
        
        while j < nums.count {
            if nPointer[i] + nPointer[j] == target {
                return [i, j]
            }
            j += 1
        }
    }
    return []
}

// pointer
// 16ms
func twoSum3(_ nums: [Int], _ target: Int) -> [Int] {
    var nNums = nums
    var nPointer = UnsafeMutablePointer<Int>(&nNums)
    
    for i in 0 ..< nums.count {
        for j in i+1 ..< nums.count {
            let mPointer = nPointer + j - i
            
            if nPointer.pointee + mPointer.pointee == target {
                return [i, j]
            }
        }
        nPointer += 1
    }
    return []
}


var nums = [3, 2, 4], target = 6
print(twoSum0(nums, target))



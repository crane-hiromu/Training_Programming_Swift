import UIKit

/*
 You are given two arrays of integers nums1 and nums2, possibly of different lengths. The values in the arrays are between 1 and 6, inclusive.
 In one operation, you can change any integer's value in any of the arrays to any value between 1 and 6, inclusive.
 Return the minimum number of operations required to make the sum of values in nums1 equal to the sum of values in nums2. Return -1​​​​​ if it is not possible to make the sum of the two arrays equal.

 Example 1:
 Input: nums1 = [1,2,3,4,5,6], nums2 = [1,1,2,2,2,2]
 Output: 3
 Explanation: You can make the sums of nums1 and nums2 equal with 3 operations. All indices are 0-indexed.
 - Change nums2[0] to 6. nums1 = [1,2,3,4,5,6], nums2 = [6,1,2,2,2,2].
 - Change nums1[5] to 1. nums1 = [1,2,3,4,5,1], nums2 = [6,1,2,2,2,2].
 - Change nums1[2] to 2. nums1 = [1,2,2,4,5,1], nums2 = [6,1,2,2,2,2].
 
 Example 2:
 Input: nums1 = [1,1,1,1,1,1,1], nums2 = [6]
 Output: -1
 Explanation: There is no way to decrease the sum of nums1 or to increase the sum of nums2 to make them equal.
 
 Example 3:
 Input: nums1 = [6,6], nums2 = [1]
 Output: 3
 Explanation: You can make the sums of nums1 and nums2 equal with 3 operations. All indices are 0-indexed.
 - Change nums1[0] to 2. nums1 = [2,6], nums2 = [1].
 - Change nums1[1] to 2. nums1 = [2,2], nums2 = [1].
 - Change nums2[0] to 4. nums1 = [2,2], nums2 = [4].
  
 Constraints:
 1 <= nums1.length, nums2.length <= 105
 1 <= nums1[i], nums2[i] <= 6
 */

// answer1 - time out
func minOperations1(_ nums1: [Int], _ nums2: [Int]) -> Int {
    // ignore out ouf range
    let nc1 = nums1.count, nc2 = nums2.count
    guard max(nc1, nc2) * 1 <= min(nc1, nc2) * 6 else { return -1 }
    return operateMin(nums1, nums2, nums1.reduce(0, +) - nums2.reduce(0, +))
}

func operateMin(_ nums1: [Int], _ nums2: [Int], _ diff: Int) -> Int {
    // print(nums1.reduce(0, +), nums2.reduce(0, +), diff)
    
    // keep nums1 biggest to simplify the code
    guard 0 < diff else {
        return operateMin(nums2, nums1, -diff)
    }
    
    // continue operation if diff is more than 6
    guard 5 < diff else {
        return calculateDiff(nums1, nums2, diff)
    }
    
    return operateArray(nums1, nums2, diff)
}

func operateArray(_ nums1: [Int], _ nums2: [Int], _ diff: Int) -> Int {
    let sortedNums1 = nums1.sorted()
    let sortedNums1max = sortedNums1.last!
    
    // give priority to the calculation with the larger difference to minimize the solution
    if (6-sortedNums1max) < nums2.min()! {
        let newDiff = diff - sortedNums1max + 1
        var _nums1 = sortedNums1.prefix(nums1.count-1)
        _nums1.insert(1, at: 0)
        return operateMin(Array(_nums1), nums2, newDiff) + 1
    } else {
        let newDiff = diff + nums2.min()! - 6
        var _nums2 = nums2.sorted().suffix(nums2.count-1)
        _nums2.append(6)
        return operateMin(nums1, Array(_nums2), newDiff) + 1
    }
}

func calculateDiff(_ nums1: [Int], _ nums2: [Int], _ diff: Int) -> Int {
    // if the difference is within a range of numbers, the calculation is done once.
    guard nums1.max()! <= diff && (6-diff) < nums2.min()! else { return 1 }
    return operateArray(nums1, nums2, diff)
}


// answer2
func minOperations(_ nums1: [Int], _ nums2: [Int]) -> Int {
    // ignore out ouf range
    let nc1 = nums1.count, nc2 = nums2.count
    guard max(nc1, nc2) * 1 <= min(nc1, nc2) * 6 else { return -1 }
    
    var sum1 = nums1.reduce(0, +)
    var sum2 = nums2.reduce(0, +)
    guard sum1 < sum2 else {
        return (sum2 == sum1) ? 0 :  minOperations(nums2, nums1)
    }
    
    let sorted1 = nums1.sorted(), sorted2 = nums2.sorted()
    var i = 0, j = nums2.count - 1, operations = 0
    
    while sum1 < sum2 {
        if j < 0 || i < sorted1.count && ((sorted2[j] - 1) < (6 - sorted1[i])) {
            sum1 += 6 - sorted1[i]
            i += 1
        }else {
            sum2 -= sorted2[j] - 1
            j -= 1
        }
        operations += 1
    }
    return operations
}

import UIKit

/*
 Given an array of integers nums, sort the array in increasing order based on the frequency of the values. If multiple values have the same frequency, sort them in decreasing order.

 Return the sorted array.

 Example 1:
 Input: nums = [1,1,2,2,2,3]
 Output: [3,1,1,2,2,2]
 Explanation: '3' has a frequency of 1, '1' has a frequency of 2, and '2' has a frequency of 3.
 
 Example 2:
 Input: nums = [2,3,1,3,2]
 Output: [1,3,3,2,2]
 Explanation: '2' and '3' both have a frequency of 2, so they are sorted in decreasing order.
 
 Example 3:
 Input: nums = [-1,1,-6,4,5,-6,1,4,1]
 Output: [5,-1,4,4,-6,-6,1,1,1]

 Constraints:

 1 <= nums.length <= 100
 -100 <= nums[i] <= 100
 */

/// answer1
func frequencySort1(_ nums: [Int]) -> [Int] {
    var dict = [Int: Int](), result = [Int]()
    
    for num in nums {
        dict[num] = (dict[num] ?? 0) + 1
    }
    
    // 大きい数字順に並べかえ　→　個数順に並べかえ　→　個数分の配列作成
    for comb in dict.sorted(by: { $1.key < $0.key }).sorted(by: { $0.value < $1.value }) {
        for _ in (0..<comb.value) {
            result.append(comb.key)
        }
    }
    
    return result
}

/// answer2 (少し綺麗にしたもの)
func frequencySort2(_ nums: [Int]) -> [Int] {
    var dict = [Int: Int]()
    
    for num in nums {
        dict[num] = (dict[num] ?? 0) + 1
    }
    
    return dict
        .sorted { $1.key < $0.key }
        .sorted { $0.value < $1.value }
        .map { [Int](repeating: $0.key, count: $0.value) }
        .flatMap { $0 }
}

import UIKit

/*
 You are given a positive integer num consisting of exactly four digits. Split num into two new integers new1 and new2 by using the digits found in num. Leading zeros are allowed in new1 and new2, and all the digits found in num must be used.

 For example, given num = 2932, you have the following digits: two 2's, one 9 and one 3. Some of the possible pairs [new1, new2] are [22, 93], [23, 92], [223, 9] and [2, 329].
 Return the minimum possible sum of new1 and new2.

 Example 1:
 Input: num = 2932
 Output: 52
 Explanation: Some possible pairs [new1, new2] are [29, 23], [223, 9], etc.
 The minimum sum can be obtained by the pair [29, 23]: 29 + 23 = 52.
 
 Example 2:
 Input: num = 4009
 Output: 13
 Explanation: Some possible pairs [new1, new2] are [0, 49], [490, 0], etc.
 The minimum sum can be obtained by the pair [4, 9]: 4 + 9 = 13.
  
 Constraints:
 1000 <= num <= 9999
 */

class Solution {
    func minimumSum(_ num: Int) -> Int {
        let numArray = Array(String(num).compactMap { Int(String($0)) })
        let sortedArray = quickSort(numArray)
        var num1 = 0, num2 = 0

        for i in 0..<sortedArray.count {
            if i % 2 == 0 {
                num1 *= 10
                num1 += sortedArray[i]
            } else {
                num2 *= 10
                num2 += sortedArray[i]
            }
        }
        return num1 + num2
    }

    func quickSort(_ nums: [Int]) -> [Int] {
        guard 1 < nums.count else { return nums }

        let pivot = nums[nums.count/2]
        let less = nums.filter { $0 < pivot }
        let equal = nums.filter { $0 == pivot }
        let greater = nums.filter { pivot < $0 }

        return quickSort(less) + equal + quickSort(greater)
    }
}

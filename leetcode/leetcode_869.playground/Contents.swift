import UIKit

/*
 You are given an integer n. We reorder the digits in any order (including the original order) such that the leading digit is not zero.

 Return true if and only if we can do this so that the resulting number is a power of two.

  

 Example 1:
 Input: n = 1
 Output: true
 
 Example 2:
 Input: n = 10
 Output: false
  
 Constraints:
 1 <= n <= 109
 */

class Solution {
    private let numbers: [Int] = {
        var array = [Int](), index: Double = 0, current: Double = 0
        let max = pow(10.0, 9.0)

        while current <= max {
            current = pow(2, index)
            array.append(Int(current))
            index += 1
        }
        return array
    }()

    func reorderedPowerOf2(_ n: Int) -> Bool {
        if numbers.contains(n) { return true }

        for number in numbers {
            let a1 = Array(String(number))
            let a2 = Array(String(n))
            
            guard a1.count == a2.count, quickSort(a1) == quickSort(a2) else { continue }
            return true
        }
        return false
    }

    func quickSort(_ nums: [Character]) -> [Character] {
        guard 1 < nums.count else { return nums }

        let pivot = nums[nums.count/2]
        let less = nums.filter { $0 < pivot }
        let equal = nums.filter { $0 == pivot }
        let greater = nums.filter { $0 > pivot }

        return quickSort(less) + equal + quickSort(greater)
    }
}

import UIKit

/*
 Given an array of distinct integers arr, find all pairs of elements with the minimum absolute difference of any two elements.
 Return a list of pairs in ascending order(with respect to pairs), each pair [a, b] follows

 a, b are from arr
 a < b
 b - a equals to the minimum absolute difference of any two elements in arr
  
 Example 1:
 Input: arr = [4,2,1,3]
 Output: [[1,2],[2,3],[3,4]]
 Explanation: The minimum absolute difference is 1. List all pairs with difference equal to 1 in ascending order.
 
 Example 2:
 Input: arr = [1,3,6,10,15]
 Output: [[1,3]]
 
 Example 3:
 Input: arr = [3,8,-10,23,19,-4,-14,27]
 Output: [[-14,-10],[19,23],[23,27]]
 */

// non used native sort api
class Solution {
    func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
        var dict = [Int: [[Int]]]()
        var array = quickSort(arr)
        var last = array.removeFirst()

        for num in array {
            dict[abs(last-num), default: []] += [[last, num]]
            last = num
        }

        let keys = Array(dict.keys)
        let key = quickSort(keys)[0]
        return dict[key]!
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

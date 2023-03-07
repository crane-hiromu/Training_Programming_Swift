import UIKit

/*
 Given an n x n matrix where each of the rows and columns is sorted in ascending order, return the kth smallest element in the matrix.
 Note that it is the kth smallest element in the sorted order, not the kth distinct element.
 You must find a solution with a memory complexity better than O(n2).

 Example 1:
 Input: matrix = [[1,5,9],[10,11,13],[12,13,15]], k = 8
 Output: 13
 Explanation: The elements in the matrix are [1,5,9,10,11,12,13,13,15], and the 8th smallest number is 13
 
 Example 2:
 Input: matrix = [[-5]], k = 1
 Output: -5
  
 Constraints:
 n == matrix.length == matrix[i].length
 1 <= n <= 300
 -109 <= matrix[i][j] <= 109
 All the rows and columns of matrix are guaranteed to be sorted in non-decreasing order.
 1 <= k <= n2
 */

class Solution {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        var numbers = [Int]()

        for line in matrix {
            for num in line {
                numbers.append(num)
            }
        }

        return quickSort(numbers)[k-1]
    }

    func quickSort(_ nums: [Int]) -> [Int] {
        guard 1 < nums.count else { return nums }

        let pivot = nums[nums.count/2]
        let less = nums.filter { $0 < pivot }
        let equal = nums.filter { $0 == pivot }
        let greater = nums.filter { $0 > pivot }

        return quickSort(less) + equal + quickSort(greater)
    }

    // Time Limit Exceeded
    func bubbleSort(_ nums: [Int]) -> [Int] {
        var array = nums
        var isSwapped = true

        while isSwapped {
            isSwapped = false

            for i in 0..<array.count-1 where array[i] > array[i+1] {
                array.swapAt(i, i+1)
                isSwapped = true
            }
        }
        return array
    }
}

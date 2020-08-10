import UIKit

/*
 Given an array of integers A sorted in non-decreasing order, return an array of the squares of each number, also in sorted non-decreasing order.

 Example 1:
 Input: [-4,-1,0,3,10]
 Output: [0,1,9,16,100]
 
 Example 2:
 Input: [-7,-3,2,3,11]
 Output: [4,9,9,49,121]
  
 Note:
 1 <= A.length <= 10000
 -10000 <= A[i] <= 10000
 A is sorted in non-decreasing order.
 */

/// failed answer ( bubble sort )
func sortedSquares(_ A: [Int]) -> [Int] {
    var result = [Int]()
    for n in A {
        result.append(n*n)
    }
    
    var isSwapped = true
    while isSwapped {
        isSwapped = false
        
        for i in 1..<result.count {
            if result[i] < result[i-1] {
                result.swapAt(i, i-1)
                isSwapped = true
            }
        }
    }
    
    return result
}

/// answer1 ( easy way )
func sortedSquares1(_ A: [Int]) -> [Int] {
    return A.map { $0*$0 }.sorted()
}


/// answer2 ( merge sort )
func sortedSquares2(_ A: [Int]) -> [Int] {
    /// 先に二乗の計算したものを作る
    var squaredNums = [Int]()
    for n in A {
        squaredNums.append(n*n)
    }
    return mergeSort(squaredNums)
}

func mergeSort(_ lists: [Int]) -> [Int] {
    guard 1 < lists.count else { return lists }
    
    /// マージソート
    let count = lists.count
    let left = Array(lists[..<Int(count/2)])
    let right = Array(lists[count/2...count-1])
    return merge(left: mergeSort(left), right: mergeSort(right))
}

func merge(left: [Int], right: [Int]) -> [Int] {
    /// ソート済みのものをマージ
    var left = left, right = right, result = [Int]()
    
    while 0 < left.count && 0 < right.count {
        if left[0] <= right[0] {
            result.append(left.removeFirst())
        } else {
            result.append(right.removeFirst())
        }
    }
    
    result.append(contentsOf: left)
    result.append(contentsOf: right)
    
    return result
}

import UIKit

/*
 Given an array A of integers, for each integer A[i] we may choose any x with -K <= x <= K, and add x to A[i].
 After this process, we have some array B.
 Return the smallest possible difference between the maximum value of B and the minimum value of B.

 Example 1:
 Input: A = [1], K = 0
 Output: 0
 Explanation: B = [1]
 
 Example 2:
 Input: A = [0,10], K = 2
 Output: 6
 Explanation: B = [2,8]
 
 Example 3:
 Input: A = [1,3,6], K = 3
 Output: 0
 Explanation: B = [3,3,3] or B = [4,4,4]
  
 Note:

 1 <= A.length <= 10000
 0 <= A[i] <= 10000
 0 <= K <= 10000

 */

/// answer1
func smallestRangeI1(_ A: [Int], _ K: Int) -> Int {
    // Aが１つの時は、それ自身が最大値であり最小値なので、xがなんであろうと差分は０
    guard !A.isEmpty else { return 0 }
    
    // ソートのアルゴリズムは省略
    let sortedA = A.sorted()
    let min = sortedA.first!, max = sortedA.last!
    
    // 最も差分が小さくなる一般項: (最大値 + -k) - (最小値 + k)
    let diff = max-min-K*2
    
    // 最大差分が０より小さければ、任意のxを選べるので0にできる。
    // ０に満たなければ、最大差分が答えとなる
    return diff < 0 ? 0 : diff
}

/// answer2 (from solution)
func smallestRangeI2(_ A: [Int], _ K: Int) -> Int {
    /// 最大値と最小値を求める
    var min = A[0], max = A[0]
    for a in A {
        if min > a { min = a }
        if max < a { max = a }
    }
    
    /// 差分を判定
    return max - min > 2 * K ? max - min - 2 * K : 0
}

import UIKit

/*
 For a non-negative integer X, the array-form of X is an array of its digits in left to right order.  For example, if X = 1231, then the array form is [1,2,3,1].
 Given the array-form A of a non-negative integer X, return the array-form of the integer X+K.

 Example 1:
 Input: A = [1,2,0,0], K = 34
 Output: [1,2,3,4]
 Explanation: 1200 + 34 = 1234
 
 Example 2:
 Input: A = [2,7,4], K = 181
 Output: [4,5,5]
 Explanation: 274 + 181 = 455
 
 Example 3:
 Input: A = [2,1,5], K = 806
 Output: [1,0,2,1]
 Explanation: 215 + 806 = 1021
 
 Example 4:
 Input: A = [9,9,9,9,9,9,9,9,9,9], K = 1
 Output: [1,0,0,0,0,0,0,0,0,0,0]
 Explanation: 9999999999 + 1 = 10000000000
 
 Note：
 1 <= A.length <= 10000
 0 <= A[i] <= 9
 0 <= K <= 10000
 If A.length > 1, then A[0] != 0
 */

/// failed answer
/// Fatal error: Double value cannot be converted to Int because the result would be greater than Int.max
func addToArrayForm1F(_ A: [Int], _ K: Int) -> [Int] {
    var sum = K
    for num in 0..<A.count {
        print(num)
        sum += A[num] * Int(pow(10.0, Double(num)))
    }
    
    var result = [Int]()
    for char in String(sum) {
        result.append(Int(String(char))!)
    }
    
    return result
}

/// answer1
func addToArrayForm(_ A: [Int], _ K: Int) -> [Int] {
    /// ２つを逆さの配列にする（後ろから合計していくため）
    var reversedA = [Int]()
    for num in A {
        reversedA.insert(num, at: 0)
    }
    var reversedK = [Int]()
    for num in Array(String(K)) {
        reversedK.insert(Int(String(num))!, at: 0)
    }
    
    /// 合計していく処理
    var reversedResult = [Int](), isMovedUp = false
    let ac = reversedA.count, kc = reversedK.count, count = (ac < kc) ? kc : ac
    for i in 0...count {
        var sum = 0
        
        /// ２つを取り出して合計する
        if reversedA.indices.contains(i) {
            sum += reversedA[i]
        }
        if reversedK.indices.contains(i) {
            sum += reversedK[i]
        }
        
        /// 前回の繰り上がりを考慮
        if isMovedUp {
            sum += 1
        }
        
        /// 繰り上がりを考慮
        if 9 < sum {
            isMovedUp = true
            sum -= 10
        } else {
            isMovedUp = false
        }
        
        /// 最後の繰り上がりが０の場合は入れない
        if i == count && sum == 0 { break }
        reversedResult.append(sum)
    }
    
    /// 逆さなので戻す
    var result = [Int]()
    for num in reversedResult {
        result.insert(num, at: 0)
    }
    return result
}

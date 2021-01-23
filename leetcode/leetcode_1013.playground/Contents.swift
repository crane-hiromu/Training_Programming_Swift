import UIKit

/*
 Given an array of integers arr, return true if we can partition the array into three non-empty parts with equal sums.
 Formally, we can partition the array if we can find indexes i + 1 < j with (arr[0] + arr[1] + ... + arr[i] == arr[i + 1] + arr[i + 2] + ... + arr[j - 1] == arr[j] + arr[j + 1] + ... + arr[arr.length - 1])
 
 Example 1:
 Input: arr = [0,2,1,-6,6,-7,9,1,2,0,1]
 Output: true
 Explanation: 0 + 2 + 1 = -6 + 6 - 7 + 9 + 1 = 2 + 0 + 1
 
 Example 2:
 Input: arr = [0,2,1,-6,6,7,9,-1,2,0,1]
 Output: false
 
 Example 3:
 Input: arr = [3,3,6,5,-2,2,5,1,-9,4]
 Output: true
 Explanation: 3 + 3 = 6 = 5 - 2 + 2 + 5 + 1 - 9 + 4
 
 Constraints:
 3 <= arr.length <= 5 * 104
 -104 <= arr[i] <= 104
 */

/// answer
func canThreePartsEqualSum(_ arr: [Int]) -> Bool {
    let total = arr.reduce(0, +)
    guard total % 3 == 0  else { return false }
    
    let average = total/3
    var result = average, counter = 0
    
    for i in arr {
        result -= i
        
        // 0は無駄にカウントされるので考慮しない
        guard i != 0, result == 0 else { continue }
        result = average
        counter += 1
    }
    
    // for文の最後の処理でリセットされている時は、計算が通っているので進める
    guard result == average else { return false }
    
    // 合計が０の時は、途中の計算数をいくらでも調整できるので、nより大きければ`true`とする
    return total == 0 ? (3 <= counter) : 3 == counter
}



/// 問題は n=3 で限定されているが、任意の数でも対応できる式を考えてみた
func canThreePartsEqualSum2(_ arr: [Int]) -> Bool {
    // 素数判定
    func isPrime(_ n:Int) -> Bool {
        if n==1 {return false}
        for k in 2..<Int(Double(n).squareRoot())+1 {
            if n%k==0 {return false}
        }
        return true
    }
    
    let total = arr.reduce(0, +)
    
    // 小さい方から考えていくが、処理を早くするために素数の場合に絞る
    for n in (2..<arr.count) where isPrime(n) {
        if total % n == 0 {
            let average = total/n
            var result = average, counter = 0
            
            for i in arr {
                result -= i
                
                // 0は無駄にカウントされるので考慮しない
                guard i != 0, result == 0 else { continue }
                result = average
                counter += 1
            }
            
            // for文の最後の処理でリセットされている時は、計算が通っているので進める
            if result == average {
                // 合計が０の時は、途中の計算数をいくらでも調整できるので、nより大きければ`true`とする
                // それ以外はnと一致した場合のみ`true`とする
                if total == 0, n <= counter {
                    return true
                } else if n == counter {
                    return true
                }
            }
        }
    }
    
    return false
}

/*
 コメント
 
 配列に０が入った場合は途中の計算式の数を調整できるので、それを考慮する必要があり、上記の式ではいずれも考慮できていない
 */

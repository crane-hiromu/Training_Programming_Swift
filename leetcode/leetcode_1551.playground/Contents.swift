import UIKit

/*
 You have an array arr of length n where arr[i] = (2 * i) + 1 for all valid values of i (i.e. 0 <= i < n).

 In one operation, you can select two indices x and y where 0 <= x, y < n and subtract 1 from arr[x] and add 1 to arr[y] (i.e. perform arr[x] -=1 and arr[y] += 1). The goal is to make all the elements of the array equal. It is guaranteed that all the elements of the array can be made equal using some operations.

 Given an integer n, the length of the array. Return the minimum number of operations needed to make all the elements of arr equal.

 Example 1:
 Input: n = 3
 Output: 2
 Explanation: arr = [1, 3, 5]
 First operation choose x = 2 and y = 0, this leads arr to be [2, 3, 4]
 In the second operation choose x = 2 and y = 0 again, thus arr = [3, 3, 3].
 
 Example 2:
 Input: n = 6
 Output: 9
  
 Constraints:
 1 <= n <= 10^4
 */

// answer1
func minOperations1(_ n: Int) -> Int {
    var array = [Int](), counter = 0
    
    // 配列を生成
    for i in (0..<n) {
        array.append(2 * i + 1)
    }
    
    // 平均値を取得
    let average = (1 + 2 * (n - 1) + 1) / 2
    
    // 値を鳴らすための計算
    for num in array {
        // 平均の値を基準として差分を追加する。（配列後半の半分は真ん中より大きく無駄なので弾く）
        guard num < average else { return counter }
        counter += (average-num)
    }
    
    return counter
}

// answer2
func minOperations2(_ n: Int) -> Int {
    if n == 0 || n == 1 { return 0 }
    
    // 平均
    let target = (1 + 2 * (n - 1) + 1) / 2
    var result = 0
    
    for i in 0..<n/2 {
        result += target - (2 * i + 1)
    }
    return result
}

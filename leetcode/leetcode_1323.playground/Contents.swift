import UIKit

/*
 Given a positive integer num consisting only of digits 6 and 9.
 Return the maximum number you can get by changing at most one digit (6 becomes 9, and 9 becomes 6).

 Example 1:
 Input: num = 9669
 Output: 9969
 Explanation:
 Changing the first digit results in 6669.
 Changing the second digit results in 9969.
 Changing the third digit results in 9699.
 Changing the fourth digit results in 9666.
 The maximum number is 9969.
 
 Example 2:
 Input: num = 9996
 Output: 9999
 Explanation: Changing the last digit 6 to 9 results in the maximum number.
 
 Example 3:
 Input: num = 9999
 Output: 9999
 Explanation: It is better not to apply any change.
  
 Constraints:
 1 <= num <= 10^4
 num's digits are 6 or 9.

 */

/// answer1
func maximum69Number1(_ num: Int) -> Int {
    var array = Array(String(num))
    
    /// 上の桁から調査し、一番最初に見つけた６を９にして処理を終わらす
    for i in 0..<array.count {
        guard array[i] == "6" else { continue }
        
        array[i] = "9"
        break
    }
    
    return Int(array.compactMap{String($0)}.reduce("", +)) ?? num
}

/// answer2 ( 1より高速なもの )
func maximum69Number2(_ num: Int) -> Int {
    var array = Array(String(num))
    
    /// 上の桁から調査し、一番最初に見つけた６を９にして処理を終わらす
    for i in 0..<array.count {
        guard array[i] == "6" else { continue }
        
        array[i] = "9"
        break
    }
    
    var result = 0
    for i in array {
        result = result*10 + Int(String(i))!
    }
    return result
}

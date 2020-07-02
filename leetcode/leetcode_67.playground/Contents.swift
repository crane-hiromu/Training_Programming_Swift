import UIKit

/*
 Given two binary strings, return their sum (also a binary string).
 The input strings are both non-empty and contains only characters 1 or 0.

 Example 1:
 Input: a = "11", b = "1"
 Output: "100"
 Example 2:

 Input: a = "1010", b = "1011"
 Output: "10101"
 */

/// failure answer(runtime error overflow)
func addBinary(_ a: String, _ b: String) -> String {
    return String((Int(a, radix: 2)! + Int(b, radix: 2)!), radix: 2)
}

/// answer
/*
 2進数なので、後ろから１つずつ数字を取り出し、合計が2以上の場合は繰り上げる
 */
func addBinary2(_ a: String, _ b: String) -> String {
    var na = a, nb = b, result = "", flag = false
    
    while !na.isEmpty || !nb.isEmpty || flag {
        let la = na.isEmpty ? 0 : Int(na.suffix(1))!
        let lb = nb.isEmpty ? 0 : Int(nb.suffix(1))!
        let sum = la + lb + (flag ? 1 : 0)

        result = "\(sum % 2)\(result)"
        flag = 1 < sum
        na = String(na.dropLast())
        nb = String(nb.dropLast())
    }
    return result
}

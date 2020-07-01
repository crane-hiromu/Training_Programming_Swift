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


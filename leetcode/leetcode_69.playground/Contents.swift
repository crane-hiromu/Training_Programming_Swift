import UIKit

/*
 Implement int sqrt(int x).
 Compute and return the square root of x, where x is guaranteed to be a non-negative integer.
 Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.

 Example 1:

 Input: 4
 Output: 2
 Example 2:

 Input: 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since
              the decimal part is truncated, 2 is returned.
 */

/// answer swify code
func mySqrt(_ x: Int) -> Int {
    return Int(Double(x).squareRoot())
}

func mySqrt2(_ x: Int) -> Int {
    return Int(sqrt(Double(x)))
}

/// mySqrt3: 上から線形探索 -> runtime error
/// mySqrt4: 下から線形探索 -> runtime 200~250
func mySqrt3(_ x: Int) -> Int {
    guard 1 < x else { return x } // ignore 0, 1
    
    var k = x/2+1
    
    while x < k*k {
        k -= 1
    }
    return k
}
func mySqrt4(_ x: Int) -> Int {
    guard 1 < x else { return x } // ignore 0, 1

    for k in (0...x/2+1) {
        if x < k*k {
            return k - 1
        }
    }
    return 0
}

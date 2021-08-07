import UIKit

/*
 Given an integer n, return true if n has exactly three positive divisors. Otherwise, return false.
 An integer m is a divisor of n if there exists an integer k such that n = k * m.

 Example 1:
 Input: n = 2
 Output: false
 Explantion: 2 has only two divisors: 1 and 2.
 
 Example 2:
 Input: n = 4
 Output: true
 Explantion: 4 has three divisors: 1, 2, and 4.
  
 Constraints:
 1 <= n <= 104
 */

func isPrime(_ number: Int) -> Bool {
   return 1 < number && !(2..<number).contains { number % $0 == 0 }
}

func isThree(_ n: Int) -> Bool {
    let r1 = Double(n).squareRoot()
    return floor(r1) == r1 && isPrime(Int(r1))
}

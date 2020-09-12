import UIKit

/*
 Write a program to find the n-th ugly number.

 Ugly numbers are positive numbers whose prime factors only include 2, 3, 5.

 Example:

 Input: n = 10
 Output: 12
 Explanation: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 is the sequence of the first 10 ugly numbers.
 Note:

 1 is typically treated as an ugly number.
 n does not exceed 1690.
 */

/// failed answer ( time out )
func nthUglyNumber(_ n: Int) -> Int {
    var counter = n-1, current = 1
    
    while 0 < counter {
        current += 1
        
        var n = current
    
        while n % 2 == 0 {
            n = n / 2
        }
        while n % 3 == 0 {
            n = n / 3
        }
        while n % 5 == 0 {
            n = n / 5
        }
        
        if n == 1 {
            counter -= 1
        }
    }
    
    return current
}

/// answer ( from discuss )
func nthUglyNumber2(_ n: Int) -> Int {
    var numbers = [1], f2 = 0, f3 = 0, f5 = 0

    for i in 1..<n {
        let r2 = numbers[f2] * 2
        let r3 = numbers[f3] * 3
        let r5 = numbers[f5] * 5

        numbers.append(min(r2, r3, r5))

        /// 重複を考慮
        if numbers[i] == r2 { f2 += 1 }
        if numbers[i] == r3 { f3 += 1 }
        if numbers[i] == r5 { f5 += 1 }
    }

    return numbers[n - 1]
}

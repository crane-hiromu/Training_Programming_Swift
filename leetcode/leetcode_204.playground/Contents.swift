import UIKit

/*
 Count the number of prime numbers less than a non-negative number, n.

 Example:
 Input: 10
 Output: 4
 Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
 */

/// failed answer ( linear search - time out )
func countPrimes1(_ n: Int) -> Int {
    var num = n-1, counter = 0
    
    while 1 < num {
        if isPrime1(target: num) {
            counter += 1
        }
        num -= 1
    }
    
    return counter
}

func isPrime1(target: Int) -> Bool {
    for i in 2..<target {
        if target % i == 0 {
            return false
        }
    }
    return true
}

/// failed answer2 ( timeout )
/// 計算して得た素数のみで割るようにしたがタイムアウト
var primes2 = [Int]()

func countPrimes2(_ n: Int) -> Int {
    guard 1 < n else { return 0 }
    
    var num = 2
    
    while num < n {
        isPrime2(target: num)
        num += 1
    }
    
    return primes2.count
}

func isPrime2(target: Int) {
    for i in primes2 {
        if target % i == 0 {
            return
        }
    }
    primes2.append(target)
}

/// answer3 ( Sieve of Eratosthenes / エラトステネスのふるい )
/// answer2を最適化して、√n（エラトステネスのふるい）以下の個数で考えた
var primes3 = [Int]()

func countPrimes(_ n: Int) -> Int {
    guard 1 < n else { return 0 }
    
    var num = 2
    
    while num < n {
        isPrime(target: num)
        num += 1
    }
    
    return primes3.count
}

func isPrime(target: Int) {
    let root = Int(Double(target).squareRoot())
    
    for i in primes3 {
        if root < i { break } // ふるいを超えたら処理を終える
        if target % i == 0 { return } // 割れてしまったら処理を終える
    }
    primes3.append(target)
}

import UIKit

/*
 We are given two strings, A and B.
 A shift on A consists of taking string A and moving the leftmost character to the rightmost position. For example, if A = 'abcde', then it will be 'bcdea' after one shift on A. Return True if and only if A can become B after some number of shifts on A.

 Example 1:
 Input: A = 'abcde', B = 'cdeab'
 Output: true

 Example 2:
 Input: A = 'abcde', B = 'abced'
 Output: false
 Note:

 A and B will have length at most 100.
 */

/// answer1 ( from discuss - 1 linear )
func rotateString1(_ A: String, _ B: String) -> Bool {
    return A == B || A.count == B.count && (A + A).contains(B)
}

/// answer2 ( from solution - Brute Force )
func rotateString2(_ A: String, _ B: String) -> Bool {
    guard A.count == B.count else { return false }
    if A == B { return true }
    
    search:
        for s in (0..<A.count) {
            for i in (0..<B.count) {
                let a = A[A.index(A.startIndex, offsetBy: (s+i)%A.count)]
                let b = B[B.index(B.startIndex, offsetBy: i)]

                if a != b {
                    continue search;
                }
            }
            return true
        }
    
    return false
}

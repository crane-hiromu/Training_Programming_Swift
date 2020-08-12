import UIKit

/*
 Given an array A of non-negative integers, half of the integers in A are odd, and half of the integers are even.
 Sort the array so that whenever A[i] is odd, i is odd; and whenever A[i] is even, i is even.
 You may return any answer array that satisfies this condition.

 Example 1:
 Input: [4,2,5,7]
 Output: [4,5,2,7]
 
 Explanation: [4,7,2,5], [2,5,4,7], [2,7,4,5] would also have been accepted.

 Note:
 2 <= A.length <= 20000
 A.length % 2 == 0
 0 <= A[i] <= 1000
 */

/// answer1
func sortArrayByParityII1(_ A: [Int]) -> [Int] {
    
    /// separate array
    var even = [Int](), odd = [Int]()
    for i in A {
        if i % 2 == 0 {
            even.append(i)
        } else {
            odd.append(i)
        }
    }
    
    /// sum array
    var result = [Int]()
    for i in 0..<even.count {
        result.append(even[i])
        result.append(odd[i])
    }
    return result
}

/// answer2 ( from discuss )
func sortArrayByParityII2(_ A: [Int]) -> [Int] {
    let even: [Int] = A.filter { $0 % 2 == 0 }
    let odd: [Int] = A.filter { $0 % 2 != 0 }
    
    return zip(even, odd).flatMap {  [$0, $1] }
}

/// answer3 ( from discuss )
func sortArrayByParityII3(_ A: [Int]) -> [Int] {
    var evenIndex = 0
    var oddIndex = 1
    var result = Array<Int>(repeating: 0, count: A.count)
    
    A.forEach {
        if $0 % 2 == 1 {
            result[oddIndex] = $0
            oddIndex += 2
        } else {
            result[evenIndex] = $0
            evenIndex += 2
        }
    }
    
    return result
}

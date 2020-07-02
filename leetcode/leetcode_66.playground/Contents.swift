import UIKit

/*
 Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
 You may assume the integer does not contain any leading zero, except the number 0 itself.

 Example 1:
 Input: [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 
 Example 2:
 Input: [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 */

/*
 test case
 
 check empty
 []
 
 check Double overflow
 [6,1,4,5,3,9,0,1,9,5,1,8,6,7,0,5,5,4,3]
 
 check Int overflow
 [7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6]
 */

/// failure answer1(it is not correct cause of overflow)
func plusOne1(_ digits: [Int]) -> [Int] {
    guard !digits.isEmpty else { return [1] }
    
    let count = digits.count-1
    let result = digits.enumerated().map { $1*Int(pow(10.0, Double(count-$0))) }.reduce(0){ $0+$1 }+1
    return "\(result)".compactMap { Int("\($0)") }
}

/// answer
func plusOne2(_ digits: [Int]) -> [Int] {
    guard !digits.isEmpty else { return [1] }
    
    var result = digits
    let count = result.count
    
    for i in (1...count) {
        increase2(num: &result[count-i])

        if result[count-i] == 0 {
            if count-i == 0 {
                result.insert(1, at:0)
            }
            continue
        } else {
            return result
        }
    }
    return result
}

func increase2(num: inout Int) {
    if num == 9 {
        num = 0
    } else {
        num += 1
    }
}

/// answer 0ms with pointer
func plusOne3(_ digits: [Int]) -> [Int] {
    guard !digits.isEmpty else { return [1] }
    
    var result = digits
    let count = result.count
    let pointer = UnsafeMutablePointer<Int>.allocate(capacity: count)
    pointer.initialize(from: &result, count: count)
    
    for i in (1...count) {
        increase3(num: &pointer[count-i])

        if pointer[count-i] == 0 {
            if count-i == 0 {
                return [1] + Array(UnsafeBufferPointer(start: pointer, count: count))
            }
            continue
        } else {
            return Array(UnsafeBufferPointer(start: pointer, count: count))
        }
    }
    
    return Array(UnsafeBufferPointer(start: pointer, count: count))
}

func increase3(num: inout Int) {
    if num == 9 {
        num = 0
    } else {
        num += 1
    }
}

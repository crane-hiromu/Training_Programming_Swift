import UIKit

// answer1
func isPalindrome1(_ x: Int) -> Bool {
    guard 0 <= x else { return false }
    guard 10 <= x else { return true }
    
    var s = String(x)

    while !(s.count == 0 || s.count == 1) {
        if s.removeFirst() != s.removeLast() {
            return false
        }
    }
    return true
}

// answer2
func isPalindrome2(_ x: Int) -> Bool {
    guard 0 <= x else { return false }

    var s: [Int] = String(x).map { Int(String($0))! }
    let p = UnsafeMutablePointer<Int>(&s)

    while !(s.count == 0 || s.count == 1) {
        if p[0] != p[s.count-1] {
            return false
        }
        s.remove(at: 0)
        s.popLast()
    }
    return true
}

// answer3
func isPalindrome3(_ x: Int) -> Bool {
    guard 0 <= x else { return false }
    guard 10 <= x else { return true }

    return String(x) == String(String(x).reversed())
}


// another

// answer4
func isPalindrome4(_ x: Int) -> Bool {
    var number = x
    var reverseNumber = 0
    
    while 0 < number {
        let reminder = number % 10
        reverseNumber = reverseNumber * 10 + reminder
        number = number / 10
    }
    return x == reverseNumber
}

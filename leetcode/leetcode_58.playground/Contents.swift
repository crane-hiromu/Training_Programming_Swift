import UIKit

/*
 Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word (last word means the last appearing word if we loop from left to right) in the string.
 If the last word does not exist, return 0.
 Note: A word is defined as a maximal substring consisting of non-space characters only.

 Example:
 Input: "Hello World"
 Output: 5
 */

/*
 expect test case
 
 "a" -> 1
 "a " -> 1
 " a " -> 1
 " " -> 0
 "" -> 0
 "        " -> 0
 */

/// answer1
func lengthOfLastWord1(_ s: String) -> Int {
    let strs = s.components(separatedBy: " ").filter { !$0.isEmpty }
    
    guard !strs.isEmpty else { return 0 }
    
    if let str = strs.last, !str.isEmpty {
        return str.count
    }
    return s.count
}

/// answer2
func lengthOfLastWord2(_ s: String) -> Int {
    let strs = s.components(separatedBy: " ").filter { !$0.isEmpty }
    
    guard !strs.isEmpty else { return 0 }
    return strs.last!.count
}

/// answer3
func lengthOfLastWord3(_ s: String) -> Int {
    guard !s.isEmpty, !(s == " ") else { return 0 }
    
    var str = s
    var counter = 0
    
    while !str.isEmpty {
        if str.suffix(1) == " " {
            if counter != 0 {
                return counter
            }
        } else {
            counter += 1
        }
        
        str = String(str.prefix(str.count-1))
    }
    return counter
}

/// answer4
func lengthOfLastWord4(_ s: String) -> Int {
    var str = s.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !s.isEmpty else { return 0 }
    
    var counter = 0
    
    while !str.isEmpty {
        if str.suffix(1) == " " {
            return counter
        }
        counter += 1
        str = String(str.prefix(str.count-1))
    }
    return counter
}

/// discuss
func lengthOfLastWord5(_ s: String) -> Int {
    return s.split(separator: " ").last?.count ?? 0
}

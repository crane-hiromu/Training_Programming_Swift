import UIKit

/*
 Given a column title as appear in an Excel sheet, return its corresponding column number.

 For example:

     A -> 1
     B -> 2
     C -> 3
     ...
     Z -> 26
     AA -> 27
     AB -> 28
     ...
 
 Example 1:
 Input: "A"
 Output: 1
 
 Example 2:
 Input: "AB"
 Output: 28
 
 Example 3:
 Input: "ZY"
 Output: 701
  
 Constraints:
 1 <= s.length <= 7
 s consists only of uppercase English letters.
 s is between "A" and "FXSHRXW".
 */

/// answer1
func titleToNumber1(_ s: String) -> Int {
    let alphabet = (65...90).map { Character(UnicodeScalar($0)) }
    
    var array = Array(s), result = 0
    array.reverse()
    
    for i in 0..<array.count {
        let index = alphabet.firstIndex(of: array[i])!+1
        
        if i == 0 {
            result += index
        } else {
            result += Int(Double(index)*pow(26.0, Double(i)))
        }
    }
    
    return result
}

/// answer2 ( from discuss )
func titleToNumber2(_ s: String) -> Int {
    return s.unicodeScalars.reduce(0) { $0 * 26 + Int($1.value) - 64 }
}

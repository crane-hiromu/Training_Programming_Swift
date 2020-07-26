import UIKit

/*
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Note that an empty string is also considered valid.

 Example 1:
 Input: "()"
 Output: true
 
 Example 2:
 Input: "()[]{}"
 Output: true
 
 Example 3:
 Input: "(]"
 Output: false
 
 Example 4:
 Input: "([)]"
 Output: false
 
 Example 5:
 Input: "{[]}"
 Output: true
 */

// answer1 (stacks)
func isValid1(_ s: String) -> Bool {
    guard !(s.count == 0) else { return true }
    
    let dic: [Character: Character] = [")": "(", "}": "{", "]": "["]
    var array = [Character]()

    for str in s {
        if dic.values.contains(str) {
            array.append(str)
        } else if array.isEmpty {
            return false
        } else if dic[str] != array.removeLast() {
            return false
        }
    }
    
    return array.isEmpty
}

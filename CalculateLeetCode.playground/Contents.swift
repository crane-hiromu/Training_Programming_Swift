
/* practice leetcode */

// https://leetcode.com/problems/valid-parentheses/
// Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
// Note that an empty string is also considered valid.

// Example 1: Input: "()", Output: true
// Example 2: Input: "()[]{}", Output: true
// Example 3: Input: "(]", Output: false
// Example 4: Input: "([)]", Output: false
// Example 5: Input: "{[]}", Output: true


// Answer 1

func isValid(s: String) -> Bool {
    guard !s.isEmpty else { return false }
    
    let stringList: [String] = s.map { "\($0)" }
    guard stringList.count % 2 == 0 else { return false } // ignore odd number
    
    let stringLastCountIndex = stringList.count - 1
    let stringHalfList = stringList[0..<Int(stringList.count/2)]
    
    let result = stringHalfList.enumerated().first { offset, element in
        let otherSide = stringList[stringLastCountIndex-offset]
   
        switch element {
        case "(":  return otherSide != ")"
        case "{":  return otherSide != "}"
        case "[":  return otherSide != "]"
        default: return true
        }
    }?.element
    
    return result == nil
}

//isValid(s: "()") // true
//isValid(s: "()[]{}") // fasle // valid
//isValid(s: "(]") // false
//isValid(s: "([)]") // false
//isValid(s: "{[]}") // true

// 半分に分割して計算量を減らそうとしたが、２問目が解決できないことに気づいた。


// Answer 2

func canCloseCharacters(_ s: String) -> Bool {
    var sArray: [Character] = []

    for t in s {
        if t == "(" || t == "{" || t == "[" {
            sArray.append(t)
        } else if t == ")" {
            if sArray.isEmpty || sArray.removeLast() != "(" {
                return false
            }
        } else if t == "}" {
            if sArray.isEmpty || sArray.removeLast() != "{" {
                return false
            }
        } else if t == "]" {
            if sArray.isEmpty || sArray.removeLast() != "[" {
                return false
            }
        }
    }

    return sArray.isEmpty
}

canCloseCharacters("()") // true
canCloseCharacters("()[]{}") // true
canCloseCharacters("(]") // false
canCloseCharacters("([)]") // false
canCloseCharacters("{[]}") // true
canCloseCharacters("") // true
canCloseCharacters("]]") // true

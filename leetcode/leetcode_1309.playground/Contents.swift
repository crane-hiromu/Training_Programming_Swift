import UIKit

/*
 You are given a string s formed by digits and '#'. We want to map s to English lowercase characters as follows:
 Characters ('a' to 'i') are represented by ('1' to '9') respectively.
 Characters ('j' to 'z') are represented by ('10#' to '26#') respectively.
 Return the string formed after mapping.
 The test cases are generated so that a unique mapping will always exist.

 Example 1:
 Input: s = "10#11#12"
 Output: "jkab"
 Explanation: "j" -> "10#" , "k" -> "11#" , "a" -> "1" , "b" -> "2".
 
 Example 2:
 Input: s = "1326#"
 Output: "acz"
  
 Constraints:
 1 <= s.length <= 1000
 s consists of digits and the '#' letter.
 s will be a valid string such that mapping is always possible.
 */

let dict: [String: String] = (1...26).reduce(into: [String: String]()) { dict, num in
    let key = String(num)
    let value = String(Character(UnicodeScalar(num+96)!))
    dict[key] = value
}

func freqAlphabets(_ s: String) -> String {
    var i = 0, str = ""
    let s = Array(s)

    while(i < s.count) {
        if i + 2 < s.count && s[i+2] == "#" {
            str.append(dict[String(s[i...i+1])]!)
            i += 3
        } else {
            str.append(dict[String(s[i])]!)
            i += 1
        }
    }
    return str
}

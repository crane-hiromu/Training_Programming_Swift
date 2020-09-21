import UIKit

/*
 Implement function ToLowerCase() that has a string parameter str, and returns the same string in lowercase.

 Example 1:
 Input: "Hello"
 Output: "hello"
 
 Example 2:
 Input: "here"
 Output: "here"
 
 Example 3:
 Input: "LOVELY"
 Output: "lovely"
 */

/// asnwer1 ( easy way )
func toLowerCase1(_ str: String) -> String {
    let upperChar:[Character] = [
        "A","B","C","D","E","F","G","H","I","J","K","L","M",
        "N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
    ]
    let lowerChar: [Character] = [
        "a","b","c","d","e","f","g","h","i","J","k","l","m",
        "n","o","p","q","r","s","t","u","v","w","x","y","z"
    ]
    
    var charComb: [Character: Character] = [:]
    for (i1, s1) in upperChar.enumerated() {
        for (i2, s2) in lowerChar.enumerated() {
            if i1 == i2 {
                charComb[s1] = s2
            }
        }
    }
    
    var result = ""
    for char in str {
        if let c = charComb[char] {
            result.append(c)
        } else {
            result.append(char)
        }
    }
    return result
}

/// answer2 ( ASCII from discuss )
func toLowerCase2(_ str: String) -> String {
    var result = ""
    for s in str {
        /// 10進数で65~９０までが、大文字のアルファベットに該当するアスキーコード
        /// 10進数で97~127までが、小文字のアルファベットに該当するアスキーコード
        if let ascii = s.asciiValue, 65 <= ascii && ascii <= 90 {
            /// +32すると小文字に変換できる
            /// Character.init(Unicode.Scalar) より変換可能
            result.append(Character(UnicodeScalar(ascii + 32)))
        } else {
            result.append(s)
        }
    }
    return result
}

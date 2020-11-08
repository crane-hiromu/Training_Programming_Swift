import UIKit

/*
 Given a valid (IPv4) IP address, return a defanged version of that IP address.
 A defanged IP address replaces every period "." with "[.]".

 Example 1:
 Input: address = "1.1.1.1"
 Output: "1[.]1[.]1[.]1"
 
 Example 2:
 Input: address = "255.100.50.0"
 Output: "255[.]100[.]50[.]0"

 Constraints:
 The given address is a valid IPv4 address.
 */

/// answer1
func defangIPaddr1(_ address: String) -> String {
    return address.map { $0 == "." ? "[.]" : "\($0)" }.reduce("", +) // .joined()
}

/// answer2
func defangIPaddr2(_ address: String) -> String {
    return address.replacingOccurrences(of: ".", with: "[.]")
}

/// answer3
func defangIPaddr3(_ address: String) -> String {
    return address.components(separatedBy: ".").joined(separator: "[.]")
}

/// answer4-1 (append)
func defangIPaddr4_1(_ address: String) -> String {
    var result = ""
    
    for str in address {
        if str == "." {
            result.append("[.]")
        }else {
            result.append(str)
        }
    }
    
    return result
}

/// answer4-2 (+=)
func defangIPaddr4_2(_ address: String) -> String {
    var result = ""
    
    for str in address {
        if str == "." {
            result += "[.]"
        } else {
            result += "\(str)"
        }
    }
    
    return result
}

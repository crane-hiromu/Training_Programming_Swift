import UIKit

/// answer (like leetcode_67)
func addStrings(_ num1: String, _ num2: String) -> String {
    var n1 = num1, n2 = num2, flag = false, result = ""
    
    while !n1.isEmpty || !n2.isEmpty || flag {
        let f1 = n1.isEmpty ? 0 : Int(n1.suffix(1))!
        let f2 = n2.isEmpty ? 0 : Int(n2.suffix(1))!
        var sum = f1 + f2 + (flag ? 1 : 0)
        
        if 10 <= sum {
            flag = true
            sum = sum % 10
        } else {
            flag = false
        }
        
        result = "\(sum)\(result)"
        n1 = String(n1.dropLast())
        n2 = String(n2.dropLast())
    }
    return result
}

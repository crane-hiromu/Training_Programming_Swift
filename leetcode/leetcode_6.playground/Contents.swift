import UIKit

/*
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

 P   A   H   N
 A P L S I I G
 Y   I   R
 
 And then read line by line: "PAHNAPLSIIGYIR"
 Write the code that will take a string and make this conversion given a number of rows:
 string convert(string s, int numRows);
 
 Example 1:
 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"
 
 Example 2:
 Input: s = "PAYPALISHIRING", numRows = 4
 Output: "PINALSIGYAHRPI"
 Explanation:

 P     I    N
 A   L S  I G
 Y A   H R
 P     I
 */

/// rowが３の時だけの場合にどうやって実行するか検証する
func convert3_1(_ s: String, _ numRows: Int) -> String {
    var r1 = ""
    var r2 = ""
    var r3 = ""
    let ci = numRows * 2 - 2
    var counter = 0

    s.enumerated().forEach { start, sc in
        let i = start + 1
        let str = String(sc)

        if i % ci == 0 {
            r2 += str
            counter += 1
        } else if i % numRows == (1+counter) % numRows {
            r1 += str
        } else if i % numRows == (2+counter) % numRows {
            r2 += str
        } else if i % numRows == (0+counter) % numRows {
            r3 += str
        }
    }
    return r1 + r2 + r3
}

/// answer
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows < s.count, numRows != 1 else { return s }
        
        // MARK: 余りで区分していく
        
        let array = Array(s), end = numRows-1
        var dic = [Int: String]()
        
        for (index, str) in array.enumerated() {
            let remainder = index % (2 * end)
            
            if let val = dic[remainder] {
                dic[remainder] = "\(val)\(str)"
            } else {
                dic[remainder] = String(str)
            }
        }
        
        // MARK: 区分したStringを結合していく
        
        var body = ""
        
        for i in (1...end) {
            guard i != end else { continue }

            var result = [Character]()
            
            guard let values1 = dic[i] else { continue }
            for (i1, d1) in values1.enumerated() {
                result.append(d1)

                guard let values2 = dic[end*2-i] else { continue }
                for (i2, d2) in values2.enumerated() {
                    guard i1 == i2 else { continue }
                    result.append(d2)
                }
            }

            body += result.map { String($0) }.reduce("") { $0+$1 }
        }
        return "\(dic[0]!)\(body)\(dic[end]!)"
    }
}

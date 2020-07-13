import UIKit

/*
 Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.

 Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

 I can be placed before V (5) and X (10) to make 4 and 9.
 X can be placed before L (50) and C (100) to make 40 and 90.
 C can be placed before D (500) and M (1000) to make 400 and 900.
 Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.

 Example 1:
 Input: "III"
 Output: 3
 Example 2:

 Input: "IV"
 Output: 4
 Example 3:

 Input: "IX"
 Output: 9
 Example 4:

 Input: "LVIII"
 Output: 58
 Explanation: L = 50, V= 5, III = 3.
 Example 5:

 Input: "MCMXCIV"
 Output: 1994
 Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
 */

/// answer1
/// この順番で確認させることが重要
let pairs: KeyValuePairs = [
    "MMM":3000, "MM":2000, "CM":900, "M":1000,
    "DCCC":800, "DCC":700, "DC":600, "CD":400, "D":500, "CCC":300, "CC":200, "XC":90, "C":100,
    "LXXX":80, "LXX":70, "LX":60, "XL":40, "L":50, "XXX":30, "XX":20, "IX":9, "X":10,
    "VIII":8, "VII":7, "VI":6, "IV":4, "V":5, "III":3, "II":2, "I":1
]

func romanToInt1(_ s: String) -> Int {
    var str = s
    var result = 0
    
    for p in pairs {
        guard !str.isEmpty else { return result }
        guard str.contains(p.key) else { continue }
        result += p.value
        str = str.replacingOccurrences(of: p.key, with: "")
    }
    return result
}

/// answer2(from discuss)
/// ローマ数字の性質をうまく利用した計算
let numerals: [Character:Int] = [
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000
]

func romanToInt2(_ s: String) -> Int {
    let array = Array(s)
    var i = 0
    var num = 0

    while i < array.count - 1 {

        let val = numerals[array[i]]!
        let next = numerals[array[i+1]]!
        num += (val < next) ? -val : val

        i += 1
    }
    num += numerals[array.last!]!

    return num
}

import UIKit

/* test case example
 - "10"              expect 10
 - "4193 with words" expect 4193
 - "words and 987"   expect 0
 - "     -42"        expect -42
 - "  -0012a42"      expect -12
 - "3.14159"         expect 3
 - ".1"              expect 0
 - "+1"              expect 1
 - ""                expect 0
 - "-91283472332"    expect -2147483648(=−2^31)
 - "20000000000000000000"
 */

func myAtoi(_ str: String) -> Int {
    let nospace = str.trimmingCharacters(in: .whitespacesAndNewlines)
    print("--nospace--", nospace)

    // １つの数字しかない場合は早期リターン(有理数を早期リターンするために「String->Double->Int」で変換)
    if let dn = Double(nospace) { return expectIndex(Int(dn))  }

    // 複数の文字列がある場合は早期リターン（最初が数字ならそれを返す。テキストなら０を返す）
    let cs = nospace.components(separatedBy: " ")
    guard cs.count < 2 else { return Int(cs.first ?? "") ?? 0 }
    print("--cs--", cs)

    guard let fi = nospace.map({String($0)}).first else { return 0 }
    print("--fi--", fi)

    var moreThanZero: Bool = true

    // +/-の判定
    if fi.isEmpty || fi == "+" {
        moreThanZero = true
    } else if fi == "-" {
        moreThanZero = false
    } else {
        return 0
    }

    let s = nospace.components(separatedBy: CharacterSet.decimalDigits.inverted)
    print("--s--", s)

    guard let d = Double(s[1]) else { return 0 }
    let i = Int(d) * (moreThanZero ? 1 : -1)
    print("--i--", i)

    return expectIndex(i)
}

// 32bit以内か判定する。そうでない場合は問題条件の値を返す
func expectIndex(_ i: Int) -> Int {
    if Int32.min <= i, i <= Int32.max {
        return i
    } else {
        return Int((0 < i) ? Int32.max : Int32.min)
    }
}

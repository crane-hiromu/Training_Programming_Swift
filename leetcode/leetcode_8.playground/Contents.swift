import UIKit

/* test case example
 - "10"                   expect 10
 - "4193 with words"      expect 4193
 - "words and 987"        expect 0
 - "     -42"             expect -42
 - "  -0012a42"           expect -12
 - "3.14159"              expect 3
 - ".1"                   expect 0
 - "+1"                   expect 1
 - ""                     expect 0
 - "1a"                   expect 1
 - "123-"                 expect 123
 - "-91283472332"         expect -2147483648(=−2^31)
 - "20000000000000000000" expect 2147483647
 - "    0000000000000   " expect 0
 */


// answer
func myAtoi0(_ str: String) -> Int {
    let tri = str.trimmingCharacters(in: .whitespacesAndNewlines)
    
    // １文字の場合は早期return
    guard Int(tri) == nil else { return expect(tri, str.contains("-") ? -1 : 1, false) }
    
    var sign = 1
    var strs = ""
    
    // 最初に出現する数字を抽出する
    for (i, st) in tri.enumerated() {
        let s = String(st)
        
        // 1文字目のみ判定
        if i == 0 {
            if s == "+" {
                sign = 1
            } else if s == "-" {
                sign = -1
            } else {
                guard Int(s) != nil else { break } // 任意の文字列の場合、即終了
                strs += s
            }
        } else {
            guard Int(s) != nil else { break } // 文字列に遭遇した段階で終了
            strs += s
            
        }
    }

    return expect(strs, sign, true)
}

func expect(_ str: String, _ sign: Int, _ flag: Bool) -> Int { // sign: 1=ポジティブ, -1=ネガティブ、　flag: 早期returnかどうか
    let istr = Int(str)

    // 9ケタまでなければ、32bit以内なので早期return
    guard 9 < str.count else { return (istr ?? 0) * (flag ? sign : 1) }

    // overflowした場合はnilになるので早期return
    guard istr != nil else { return Int((sign == 1) ? Int32.max : Int32.min) }

    let i = istr ?? 0

    if Int32.min <= i, i <= Int32.max {
        return i * (flag ? sign : 1)
    } else {
        return Int((sign == 1) ? Int32.max : Int32.min)
    }
}

// pointer使用版
func myAtoiP(_ str: String) -> Int {
    let tri = str.trimmingCharacters(in: .whitespacesAndNewlines)
    
    // １文字の場合は早期return
    guard Int(tri) == nil else { return expect(tri, str.contains("-") ? -1 : 1, false) }
    
    var sign = 1
    var strs = ""
    let strsp = UnsafeMutablePointer<String>(&strs)
    
    // 最初に出現する数字を抽出する
    for (i, st) in tri.enumerated() {
        let s = String(st)
        
        // 1文字目のみ判定
        if i == 0 {
            if s == "+" {
                sign = 1
            } else if s == "-" {
                sign = -1
            } else {
                guard Int(s) != nil else { break } // 任意の文字列の場合、即終了
                strsp.pointee += s
            }
        } else {
            guard Int(s) != nil else { break } // 文字列に遭遇した段階で終了
            strsp.pointee += s
        }
    }

    return expect(strsp.pointee, sign, true)
}



/* 間違った答え（愚直に取り除いた見たパターン） */

func myAtoi1(_ str: String) -> Int {
    let nospace = str.trimmingCharacters(in: .whitespacesAndNewlines)
    print("--nospace--", nospace)

    // １つの数字しかない場合は早期リターン(有理数を早期リターンするために「String->Double->Int」で変換)
    if let dn = Double(nospace) {
        if let ei = rangeIndex(dn) {
            return ei
        } else {
            return expect(Int(dn))
        }
    }

    // 複数の文字列がある場合は早期リターン（最初が数字ならそれを返す。テキストなら０を返す）
    let cs = nospace.components(separatedBy: " ")
    guard cs.count < 2 else { return Int(cs.first ?? "") ?? 0 }
    print("--cs--", cs)

    guard let fi = nospace.map({String($0)}).first else { return 0 }
    print("--fi--", fi)

    var moreThanZero: Bool = true

    // 先頭の文字列が特定の条件下で分岐
    if fi.isEmpty || fi == "+" {
        moreThanZero = true
    } else if fi == "-" {
        moreThanZero = false
    } else if let i = Int(fi) {
        // // 後ろに文字列がくっついている場合を取り除く
        // let cfi = cs.first
        // let new = cfi?.components(separatedBy: CharacterSet.decimalDigits.inverted).joined() ?? ""
        // guard cfi == new else { return Int(new) ?? 0 }
        return i
    } else {
        return 0
    }

    let s = nospace.components(separatedBy: CharacterSet.decimalDigits.inverted)
    print("--s--", s)

    guard let d = Double(s[1]) else { return 0 }
    let i = Int(d) * (moreThanZero ? 1 : -1)
    print("--i--", i)

    return expect(i)
}

// 32bit以内か判定する。そうでない場合は問題条件の値を返す
func expect(_ i: Int) -> Int {
    if Int32.min <= i, i <= Int32.max {
        return i
    } else {
        return Int((0 < i) ? Int32.max : Int32.min)
    }
}

// Intがオーバーフローしない範囲か判定する
func rangeIndex(_ d: Double) -> Int? {
    if Double(Int.max) <= d {
        return Int(Int32.max)
    } else if d <= Double(Int32.min) {
        return Int(Int32.min)
    } else {
        return nil
    }
}

/* /////////////////////////////////////////////////////// */

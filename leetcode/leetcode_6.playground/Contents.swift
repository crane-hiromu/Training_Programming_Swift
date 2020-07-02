import UIKit

/*
 rowが３の時だけの場合にどうやって実行するか検証する
 
 Example 1:

 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"
 */

// 愚直に値を指定した
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

// マジックナンバーを極力取り除いたパターン
func convert3_2(_ s: String, _ numRows: Int) -> String {
    var strs = [Int: String]()

    let ci = numRows * 2 - 2
    var counter = 0

    s.enumerated().forEach { start, sc in
        let i = start + 1
        let str = String(sc)

        if i % ci == 0 {
            counter += 1
            let ici = numRows - 1
            strs[ici] = (strs[ici] ?? "")+str
        } else {
            let ei = (i-counter) % numRows
            let res = (ei == 0) ? numRows : ei
            strs[res] = (strs[res] ?? "")+str
        }
    }

    return strs.sorted { $0.key < $1.key }.map { $0.value }.reduce("") { $0+$1 }
}

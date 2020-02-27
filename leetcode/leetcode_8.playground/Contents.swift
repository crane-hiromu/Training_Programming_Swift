import UIKit

// wip

func myAtoi(_ str: String) -> Int {
    let s = str.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ")

    guard let d = Double(s[0]) else { return 0 }
    let i = Int(d)

    if Int32.min <= i, i <= Int32.max {
        return i
    } else {
        return Int((0 < i) ? Int32.max : Int32.min)
    }
}

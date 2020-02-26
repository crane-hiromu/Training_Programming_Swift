import UIKit

// answer1
func reverse(_ x: Int) -> Int {
    let l = Int(pow(2.0, 31))

    if 0 < x {
        let r = Int(String(String(x).reversed()))!

        if (-l <= r && r <= l) {
            return r
        } else {
            return 0
        }

    } else {
        let r = -Int(String(String(-x).reversed()))!

        if (-l <= r && r <= l) {
            return r
        } else {
            return 0
        }

    }
}

// answer2
func reverse2(_ x: Int) -> Int {
    if 0 < x {
        let r = Int(String(String(x).reversed()))!

        if (Int32.min <= r && r <= Int32.max) {
            return r
        } else {
            return 0
        }

    } else {
        let r = -Int(String(String(-x).reversed()))!

        if (Int32.min <= r && r <= Int32.max) {
            return r
        } else {
            return 0
        }

    }
}

// answer3
func reverse3(_ x: Int) -> Int {
    if 0 < x {
      return Int(Int32(String(String(x).reversed())) ?? 0)
    } else {
      return -Int(Int32(String(String(-x).reversed())) ?? 0)
    }
}

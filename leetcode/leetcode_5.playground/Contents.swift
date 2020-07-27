import UIKit

/*
 Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

 Example 1:
 Input: "babad"
 Output: "bab"
 Note: "aba" is also a valid answer.
 
 Example 2:
 Input: "cbbd"
 Output: "bb"
 */

/// answer1 -  faild ( brute force - timeout )
func longestPalindrome1(_ s: String) -> String {
    guard 1 < s.count else { return s }
    
    let array = Array(s)
    var left = 0
    let right = s.count-1
    var result = ""
    var hasCenter = false
    var hasOpposite = false
    
    while left < right {
        let key = array[left]
                    
        array.enumerated().filter { i, v in i != left && v == key }.forEach { i, v in
            var innerLeft = left
            var innerRight = i
            var innerResult = ""
            
            while innerLeft <= innerRight {
                let current = array[innerLeft]
                let opposite = array[innerRight]
                
                guard current == opposite else { break }
                innerRight -= 1
                innerLeft += 1
                innerResult = "\(innerResult)\(current)"
            }
            
            // １個差の時には多い方を取得したいので
            let c1 = result.count
            let c2 = innerResult.count
            let diff = (innerLeft-innerRight)
                                                            
            if (c1 < c2 || (c1 == c2 && hasCenter)) && 0 < diff {
                result = innerResult
                hasCenter = diff == 2 // whileでbreakした時の条件として、左右が同じ場合は１つずつずれるので
                hasOpposite = diff == 1 // １文字の時、左右対称なのか単体なのかを判定する
            }
        }

        left += 1
    }
    
    // 繰り返しがない場合は先頭の文字を返す
    if result.isEmpty || (result.count == 1 && !hasOpposite) {
        return String(s.first!)
    }
    
    // 偶数・奇数の分岐
    var reversed = ""
    if hasCenter {
        reversed = String(result.prefix(result.count-1).reversed())
    } else {
        reversed = String(result.reversed())
    }
    return "\(result)\(reversed)"
}

/// answer2
/// 中心を選択し左右を評価していく（１つの場合・同じ文字列の場合の２パターン考える）
var array = [String.Element]()
var result = ArraySlice<String.Element>()

func longestPalindrome2(_ s: String) -> String {
    guard 1 < s.count else { return s }
    
    array = Array(s)
    
    for i in (0..<array.count) {
        let left = i, right = i
        
        /// 中心が奇数
        calc(l: left, r: right)
        
        /// 中心が偶数
        guard left+1 < array.count, array[left] == array[left+1] else { continue }
        calc(l: left, r: left+1)
    }
    
    return result.map { String($0) }.reduce("") { $0+$1 }
}

func calc(l: Int, r: Int) {
    var left = l
    var right = r
    
    while true {
        /// breakする場合はその値を考慮しないので１つ戻す
        guard array[left] == array[right] else {
            left += 1
            right -= 1
            break
        }

        /// マイナス値の考慮
        guard left != 0 && right != array.count-1 else { break }
        left -= 1
        right += 1
    }

    guard 0 <= left, right < array.count, result.count <= right-left else { return }
    result = array[left...right]
}

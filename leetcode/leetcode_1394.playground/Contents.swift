import UIKit

/*
 Given an array of integers arr, a lucky integer is an integer which has a frequency in the array equal to its value.
 Return a lucky integer in the array. If there are multiple lucky integers return the largest of them. If there is no lucky integer return -1.

 Example 1:
 Input: arr = [2,2,3,4]
 Output: 2
 Explanation: The only lucky number in the array is 2 because frequency[2] == 2.
 
 Example 2:
 Input: arr = [1,2,2,3,3,3]
 Output: 3
 Explanation: 1, 2 and 3 are all lucky numbers, return the largest of them.
 
 Example 3:
 Input: arr = [2,2,2,3,3]
 Output: -1
 Explanation: There are no lucky numbers in the array.
 
 Example 4:
 Input: arr = [5]
 Output: -1
 
 Example 5:
 Input: arr = [7,7,7,7,7,7,7]
 Output: 7
  
 Constraints:
 1 <= arr.length <= 500
 1 <= arr[i] <= 500

 */


// answer1
func findLucky1(_ arr: [Int]) -> Int {
    // 最後が計算されないので、任意の数字を１つ足す
    let new = (arr.sorted() + [-1])
    var current = -1, count = 0, result = -1
    
    for num in new {
        if current == num {
            count += 1
        } else {
            if current == count {
                result = count
            }
            
            current = num
            count = 1
        }
    }
    
    return result
}

// answer2 (改良型)
func findLucky2(_ arr: [Int]) -> Int {
    // 大きい方から計算するので、マッチした段階で計算が終了して高速化できる
    // 最後が計算されないので、任意の数字を１つ足す
    var new =  arr
    new.sort { $0 > $1 }
    new.append(-1)
    
    var current = -1, count = 0, result = -1
    
    for num in new {
        if current == num {
            count += 1
        } else {
            if current == count {
                return count
            }
            
            current = num
            count = 1
        }
    }
    
    return result
}

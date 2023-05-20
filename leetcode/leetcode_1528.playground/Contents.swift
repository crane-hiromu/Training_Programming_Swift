import UIKit

/*
 You are given a string s and an integer array indices of the same length. The string s will be shuffled such that the character at the ith position moves to indices[i] in the shuffled string.
 Return the shuffled string.

 Example 1:
 Input: s = "codeleet", indices = [4,5,6,7,0,2,1,3]
 Output: "leetcode"
 Explanation: As shown, "codeleet" becomes "leetcode" after shuffling.
 
 Example 2:
 Input: s = "abc", indices = [0,1,2]
 Output: "abc"
 Explanation: After shuffling, each character remains in its position.
  
 Constraints:
 s.length == indices.length == n
 1 <= n <= 100
 s consists of only lowercase English letters.
 0 <= indices[i] < n
 All values of indices are unique.
 */

class Solution {
    func restoreString(_ s: String, _ indices: [Int]) -> String {
        let array = Array(s)
        var store = [(Int, Character)]()
        for i in 0..<indices.count {
            store.append((indices[i], array[i]))
        }
        
        let sortedStore = quickSort(store)
        var result = ""
        for (_, char) in sortedStore {
            result += String(char)
        }

        return result
    }

    func quickSort(_ nums: [(Int, Character)]) -> [(Int, Character)] {
        guard 1 < nums.count else { return nums }

        let pivot = nums[nums.count/2]
        let less = nums.filter { $0.0 < pivot.0 }
        let equal = nums.filter { $0.0 == pivot.0 }
        let greater = nums.filter { $0.0 > pivot.0 }

        return quickSort(less) + equal + quickSort(greater)
    }
}

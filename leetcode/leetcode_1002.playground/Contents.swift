import UIKit

/*
 Given a string array words, return an array of all characters that show up in all strings within the words (including duplicates). You may return the answer in any order.

 Example 1:
 Input: words = ["bella","label","roller"]
 Output: ["e","l","l"]
 
 Example 2:
 Input: words = ["cool","lock","cook"]
 Output: ["c","o"]
  
 Constraints:
 1 <= words.length <= 100
 1 <= words[i].length <= 100
 words[i] consists of lowercase English letters.
 */

class Solution {
    func commonChars(_ words: [String]) -> [String] {
        var result = [String]()
        var dict = [Character: [Int]]()
        
        for i in 0..<words.count {
            for char in words[i] {
                var array = dict[char] ?? Array(repeating: 0, count: words.count)
                array[i] += 1
                dict[char] = array
            }
        }

        for (key, value) in dict {
            let maximum = value.max()!
            var maxDiff = 0
            
            for i in 0..<value.count {
                maxDiff = max(maximum-value[i], maxDiff)
            }
            let strs = Array(repeating: String(key), count: maximum-maxDiff)
            result.append(contentsOf: strs)
        }
        return result
    }
}

import UIKit

/*
 A pangram is a sentence where every letter of the English alphabet appears at least once.
 Given a string sentence containing only lowercase English letters, return true if sentence is a pangram, or false otherwise.

 Example 1:
 Input: sentence = "thequickbrownfoxjumpsoverthelazydog"
 Output: true
 Explanation: sentence contains at least one of every letter of the English alphabet.
 
 Example 2:
 Input: sentence = "leetcode"
 Output: false
  
 Constraints:
 1 <= sentence.length <= 1000
 sentence consists of lowercase English letters.
 */

// asnwer1 One liner
func checkIfPangram1(_ sentence: String) -> Bool {
    Set(sentence).isSuperset(of: (97...122).map { Character(UnicodeScalar($0)) })
}

// answer2 Dictionary
func checkIfPangram2(_ sentence: String) -> Bool {
    var alphabets = (97...122).map { Character(UnicodeScalar($0)) }.reduce(into: [Character: Int]()) { $0[$1] = 0 }
        
    sentence.forEach {
        alphabets[$0] = (alphabets[$0] ?? 0) + 1
    }

    return alphabets.values.first { $0 == 0 } == nil
}

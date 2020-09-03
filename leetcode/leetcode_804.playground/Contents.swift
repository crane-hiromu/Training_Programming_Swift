import UIKit

/*
 International Morse Code defines a standard encoding where each letter is mapped to a series of dots and dashes, as follows: "a" maps to ".-", "b" maps to "-...", "c" maps to "-.-.", and so on.
 For convenience, the full table for the 26 letters of the English alphabet is given below:

 [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
 
 Now, given a list of words, each word can be written as a concatenation of the Morse code of each letter. For example, "cab" can be written as "-.-..--...", (which is the concatenation "-.-." + ".-" + "-..."). We'll call such a concatenation, the transformation of a word.

 Return the number of different transformations among all words we have.

 Example:
 Input: words = ["gin", "zen", "gig", "msg"]
 Output: 2
 Explanation:
 The transformation of each word is:
 "gin" -> "--...-."
 "zen" -> "--...-."
 "gig" -> "--...--."
 "msg" -> "--...--."

 There are 2 different transformations, "--...-." and "--...--.".
 Note:

 The length of words will be at most 100.
 Each words[i] will have length in range [1, 12].
 words[i] will only consist of lowercase letters.

 */


/// answer1
let alfabets = (97...122).map {Character(UnicodeScalar($0)) }
let codes =  [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]

func uniqueMorseRepresentations1(_ words: [String]) -> Int {
    /// 自分で配列を定義するのも冗長なので、コードで生成している
    let comb = (0..<alfabets.count).reduce(into: [Character: String]()) { $0[alfabets[$1]] = codes[$1] }
    var wordCodes = Set<String>()
    
    for word in words {
        var code = ""
        for str in word {
            code += comb[str]!
        }
        wordCodes.insert(code)
    }
    
    return wordCodes.count
}

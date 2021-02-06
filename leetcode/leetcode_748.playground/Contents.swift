import UIKit

/*
 Given a string licensePlate and an array of strings words, find the shortest completing word in words.
 A completing word is a word that contains all the letters in licensePlate. Ignore numbers and spaces in licensePlate, and treat letters as case insensitive. If a letter appears more than once in licensePlate, then it must appear in the word the same number of times or more.
 For example, if licensePlate = "aBc 12c", then it contains letters 'a', 'b' (ignoring case), and 'c' twice. Possible completing words are "abccdef", "caaacab", and "cbca".
 Return the shortest completing word in words. It is guaranteed an answer exists. If there are multiple shortest completing words, return the first one that occurs in words.

 Example 1:
 Input: licensePlate = "1s3 PSt", words = ["step","steps","stripe","stepple"]
 Output: "steps"
 Explanation: licensePlate contains letters 's', 'p', 's' (ignoring case), and 't'.
 "step" contains 't' and 'p', but only contains 1 's'.
 "steps" contains 't', 'p', and both 's' characters.
 "stripe" is missing an 's'.
 "stepple" is missing an 's'.
 Since "steps" is the only word containing all the letters, that is the answer.
 
 Example 2:
 Input: licensePlate = "1s3 456", words = ["looks","pest","stew","show"]
 Output: "pest"
 Explanation: licensePlate only contains the letter 's'. All the words contain 's', but among these "pest", "stew", and "show" are shortest. The answer is "pest" because it is the word that appears earliest of the 3.
 
 Example 3:
 Input: licensePlate = "Ah71752", words = ["suggest","letter","of","husband","easy","education","drug","prevent","writer","old"]
 Output: "husband"
 
 Example 4:
 Input: licensePlate = "OgEu755", words = ["enough","these","play","wide","wonder","box","arrive","money","tax","thus"]
 Output: "enough"
 
 Example 5:
 Input: licensePlate = "iMSlpe4", words = ["claim","consumer","student","camera","public","never","wonder","simple","thought","use"]
 Output: "simple"

 */

func shortestCompletingWord(_ licensePlate: String, _ words: [String]) -> String {
    let store = analyze(word: licensePlate)
    var result = "", max = 0
             
    for word in words {
        // 指定の文字を含む数をカウント
        var counter = 0
        
        // カウントの計算
        for comb in analyze(word: word) {
            guard let val = store[comb.key] else { continue }
            counter += (comb.value <= val) ? comb.value : val
        }
        
        // 含む数が多い場合 or 含む数が同じ場合は文字数が少ない方を選ぶ
        guard max < counter || (max == counter && word.count < result.count) else { continue }
        max = counter
        result = word
    }
    
    return result
}

// 文字ごとのカウント数を持ったDictに変換する
func analyze(word: String) -> [Character: Int] {
    return word
        .lowercased()
        .reduce(into: [:], {$0[$1, default: 0] += 1})
        .filter { !$0.key.isNumber && !$0.key.isWhitespace }
}

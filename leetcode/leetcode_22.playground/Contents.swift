import UIKit

/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 Example 1:
 Input: n = 3
 Output: ["((()))","(()())","(())()","()(())","()()()"]
 
 Example 2:
 Input: n = 1
 Output: ["()"]
  
 Constraints:
 1 <= n <= 8
 */

/*
1 "("

1-1 "(("
1-2 "()"

1-1-1 "((("
1-1-2 "(()"
1-2-1 "()("

1-1-1-1 "((()"
1-1-2-1 "(()("
1-1-2-2 "(())"
1-2-1-1 "()(("
1-2-1-2 "()()"

1-1-1-1-1 "((())"
1-1-2-1-1 "(()()"
1-1-2-2-1 "(())("
1-2-1-1-1 "()(()"
1-2-1-2-1 "()()("

1-1-1-1-1-1 "((()))"
1-1-2-1-1-1 "(()())"
1-1-2-2-1-1 "(())()"
1-2-1-1-1-1 "()(())"
1-2-1-2-1-1 "()()()"
*/

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        backtrack("", 0, 0, n) { result.append($0) }
        return result
    }

    func backtrack(_ str: String, _ left: Int, _ right: Int, _ max: Int, _ result: (String) -> Void) {
        if str.count == max * 2 { // `(`と`)`　２つで１つなので全部揃うのは、nの２倍
            result(str)
            return
        }
        
        if left < max { backtrack(str + "(", left + 1, right, max, result) }
        if right < left  { backtrack(str + ")", left, right + 1, max, result) }
    }
}

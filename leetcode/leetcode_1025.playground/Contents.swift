import UIKit

/*
 Alice and Bob take turns playing a game, with Alice starting first.
 Initially, there is a number N on the chalkboard.  On each player's turn, that player makes a move consisting of:

 Choosing any x with 0 < x < N and N % x == 0.
 Replacing the number N on the chalkboard with N - x.
 Also, if a player cannot make a move, they lose the game.
 Return True if and only if Alice wins the game, assuming both players play optimally.

 Example 1:
 Input: 2
 Output: true
 Explanation: Alice chooses 1, and Bob has no more moves.
 
 Example 2:
 Input: 3
 Output: false
 Explanation: Alice chooses 1, Bob chooses 1, and Alice has no more moves.
  
 Note:
 1 <= N <= 1000
 */

/// (すべて１を選択する場合で考えた結果)
func divisorGame1(_ N: Int) -> Bool {
    var n = N, counter = 0
    
    while n != 1 {
        n = n-1
        counter += 1
    }
    
    return counter % 2 != 0
}

func divisorGame2(_ N: Int) -> Bool {
    /// 数学的な発想において初回が偶数か奇数かで、あとの数字をコントロールできるので勝ちがきまる
    /// 最後に２がくるようにコントロールできる方が勝ちを取れるので、そうなるようにxを選択する
    /// その際、奇数ではそれができないためアリスは負ける
    return N % 2 == 0
}

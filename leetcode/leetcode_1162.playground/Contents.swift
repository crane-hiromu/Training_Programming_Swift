import UIKit

/*
 Given the root of a binary tree, the level of its root is 1, the level of its children is 2, and so on.
 Return the smallest level x such that the sum of all the values of nodes at level x is maximal.

 Example 1:
 Input: root = [1,7,0,7,-8,null,null]
 Output: 2
 Explanation:
 Level 1 sum = 1.
 Level 2 sum = 7 + 0 = 7.
 Level 3 sum = 7 + -8 = -1.
 So we return the level with the maximum sum which is level 2.
 
 Example 2:
 Input: root = [989,null,10250,98693,-89388,null,null,null,-32127]
 Output: 2
  
 Constraints:
 The number of nodes in the tree is in the range [1, 104].
 -105 <= Node.val <= 105
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// BFS
class Solution {
    func maxLevelSum(_ root: TreeNode?) -> Int {
        guard let r = root else { return 0 }

        var queues = [r]
        var maximum = Int.min
        var level = 1
        var result = level

        while !queues.isEmpty {
            var _queues = queues
            var sum = 0

            for _ in _queues {
                let queue = queues.removeFirst()
                sum += queue.val

                if let l = queue.left { queues.append(l) }
                if let r = queue.right { queues.append(r) }
            }

            if maximum < sum {
                result = level
                maximum = sum
            }
            level += 1
        }

        return result
    }
}

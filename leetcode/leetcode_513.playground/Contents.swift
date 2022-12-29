import UIKit

/*
 Given the root of a binary tree, return the leftmost value in the last row of the tree.

 Example 1:
 Input: root = [2,1,3]
 Output: 1
 
 Example 2:
 Input: root = [1,2,3,4,null,5,6,null,null,7]
 Output: 7
  
 Constraints:
 The number of nodes in the tree is in the range [1, 104].
 -231 <= Node.val <= 231 - 1
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
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        guard let r = root else { return 0 }

        var queues = [r]
        var result = r.val

        while !queues.isEmpty {
            var _queues = queues
            var num: Int?

            for _ in _queues {
                let queue = queues.removeFirst()

                if let q = queue.left {
                    num = num == nil ? q.val : num
                    queues.append(q)
                }
                if let q = queue.right {
                    num = num == nil ? q.val : num
                    queues.append(q)
                }
            }
            if let n = num {
                result = n
            }
        }

        return result
    }
}

// DFS
class Solution2 {
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        dfs(next: root).val
    }

    func dfs(next node: TreeNode?) -> (level: Int, val: Int) {
        guard let n = node else { return (level: 0, val: 0) }
        let left = dfs(next: n.left)
        let right = dfs(next: n.right)

        if left.val == 0 && right.val == 0 {
            return (level: 1, val: n.val)
        }

        return left.level < right.level ? (level: right.level+1, val: right.val) : (level: left.level+1, val: left.val)
    }
}

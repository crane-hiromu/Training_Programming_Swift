import UIKit

/*
 Given the root of a binary tree, return the same tree where every subtree (of the given tree) not containing a 1 has been removed.
 A subtree of a node node is node plus every node that is a descendant of node.

 Example 1:
 Input: root = [1,null,0,0,1]
 Output: [1,null,0,null,1]
 Explanation:
 Only the red nodes satisfy the property "every subtree not containing a 1".
 The diagram on the right represents the answer.
 
 Example 2:
 Input: root = [1,0,1,0,0,0,1]
 Output: [1,null,1,null,1]
 
 Example 3:
 Input: root = [1,1,0,1,1,0,1,0]
 Output: [1,1,0,1,1,null,1]
  
 Constraints:
 The number of nodes in the tree is in the range [1, 200].
 Node.val is either 0 or 1.
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

// DFS
class Solution {
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        dfs(next: root)
    }

    func dfs(next node: TreeNode?) -> TreeNode? {
        guard var n = node else { return nil }
        n.left = dfs(next: n.left)
        n.right = dfs(next: n.right)
        return hasSubNode(n) ? n : nil
    }

    func hasSubNode(_ node: TreeNode) -> Bool {
        !(node.val == 0 && node.left == nil && node.right == nil)
    }
}

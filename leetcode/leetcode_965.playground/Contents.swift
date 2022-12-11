import UIKit

/*
 A binary tree is uni-valued if every node in the tree has the same value.
 Given the root of a binary tree, return true if the given tree is uni-valued, or false otherwise.

 Example 1:
 Input: root = [1,1,1,1,1,null,1]
 Output: true
 
 Example 2:
 Input: root = [2,2,2,5,2]
 Output: false
  
 Constraints:
 The number of nodes in the tree is in the range [1, 100].
 0 <= Node.val < 100
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
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        postorder(next: root, current: root?.val)
    }

    func postorder(next node: TreeNode?, current: Int?) -> Bool {
        guard let n = node, let c = current else { return true }
        if n.val != c { return false }

        return postorder(next: n.left, current: n.val)
            && postorder(next: n.right, current: n.val)
    }
}

// BSF
class Solution2 {
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard let n = root else { return true }

        var queues = [n]
        var val = n.val

        while !queues.isEmpty {
            let queue = queues.removeFirst()

            if val != queue.val { return false }
            if let l = queue.left { queues.append(l) }
            if let r = queue.right { queues.append(r) }
        }
        return true
    }
}

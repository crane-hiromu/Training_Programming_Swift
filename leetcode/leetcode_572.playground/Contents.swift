import UIKit

/*
 Given the roots of two binary trees root and subRoot, return true if there is a subtree of root with the same structure and node values of subRoot and false otherwise.

 A subtree of a binary tree tree is a tree that consists of a node in tree and all of this node's descendants. The tree tree could also be considered as a subtree of itself.

 Example 1:
 Input: root = [3,4,5,1,2], subRoot = [4,1,2]
 Output: true
 
 Example 2:
 Input: root = [3,4,5,1,2,null,null,null,null,0], subRoot = [4,1,2]
 Output: false
  
 Constraints:
 The number of nodes in the root tree is in the range [1, 2000].
 The number of nodes in the subRoot tree is in the range [1, 1000].
 -104 <= root.val <= 104
 -104 <= subRoot.val <= 104
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

// BFS * BFS
class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard let r = root, let s = subRoot else { return false }

        var queues = [r]

        while !queues.isEmpty {
            let queue = queues.removeFirst()

            if queue.val == s.val, bfs(queue) == bfs(s) { return true }
            if let l = queue.left { queues.append(l) }
            if let r = queue.right { queues.append(r) }
        }

        return false
    }

    func bfs(_ root: TreeNode) -> [Int?] {
        var queues = [root]
        var nums = [Int?]()

        while !queues.isEmpty {
            let queue = queues.removeFirst()
            if let l = queue.left {
                nums.append(l.val)
                queues.append(l)
            } else {
                nums.append(nil)
            }
            if let r = queue.right {
                nums.append(r.val)
                queues.append(r)
            } else {
                nums.append(nil)
            }
        }
        return nums
    }
}

import UIKit

/*
 Given the root of a binary tree with unique values and the values of two different nodes of the tree x and y, return true if the nodes corresponding to the values x and y in the tree are cousins, or false otherwise.

 Two nodes of a binary tree are cousins if they have the same depth with different parents.
 Note that in a binary tree, the root node is at the depth 0, and children of each depth k node are at the depth k + 1.

 Example 1:
 Input: root = [1,2,3,4], x = 4, y = 3
 Output: false
 
 Example 2:
 Input: root = [1,2,3,null,4,null,5], x = 5, y = 4
 Output: true
 
 Example 3:
 Input: root = [1,2,3,null,4], x = 2, y = 3
 Output: false
  
 Constraints:
 The number of nodes in the tree is in the range [2, 100].
 1 <= Node.val <= 100
 Each node has a unique value.
 x != y
 x and y are exist in the tree.
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
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        guard let r = root else { return false }

        var depth = [Int: Int]()
        var parent = [Int: Int]()
        var queues: [TreeNode] = [r]
        var level = 0

        while !queues.isEmpty {
            for i in 0..<queues.count {
                let node = queues.removeFirst()
                depth[node.val] = level

                if let l = node.left {
                    parent[l.val] = node.val
                    queues.append(l)
                }
                if let r = node.right {
                    parent[r.val] = node.val
                    queues.append(r)
                }
            }
            level += 1
        }
        
        return depth[x] == depth[y] && parent[x] != parent[y]
    }
}

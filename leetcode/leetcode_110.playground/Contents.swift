import UIKit

/*
 Given a binary tree, determine if it is height-balanced.
 For this problem, a height-balanced binary tree is defined as:
 a binary tree in which the left and right subtrees of every node differ in height by no more than 1.

 Example 1:
 Input: root = [3,9,20,null,null,15,7]
 Output: true
 
 Example 2:
 Input: root = [1,2,2,3,3,null,null,4,4]
 Output: false
 
 Example 3:
 Input: root = []
 Output: true
  
 Constraints:
 The number of nodes in the tree is in the range [0, 5000].
 -104 <= Node.val <= 104
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
func isBalanced1(_ root: TreeNode?) -> Bool {
    guard let r = root else { return true }
    
    // 左右の深さを取得する
    let leftDepth = depth(r.left)
    let rightDepth = depth(r.right)
    let diff = abs(leftDepth - rightDepth)
    
    // 各枝ごとに Balanced Binary Tree であることを判定する必要がある
    return diff < 2 && isBalanced1(r.left) && isBalanced1(r.right)
}

func depth(_ root: TreeNode?) -> Int {
    guard let node = root else { return 0 }
    
    var maxDepth = 1
    var queue = [(node: node, depth: maxDepth)]
    
    while !queue.isEmpty {
        let obj = queue.removeFirst()

        // 最も深い位置のdepthを取得する
        if obj.node.left == nil && obj.node.right == nil {
            maxDepth = max(maxDepth, obj.depth)
        }
        // 左右にnodeがある場合は処理を継続する
        if let l = obj.node.left {
            queue.append((l, obj.depth+1))
        }
        if let r = obj.node.right {
            queue.append((r, obj.depth+1))
        }
    }
    return maxDepth
}

// DFS
func isBalanced2(_ root: TreeNode?) -> Bool {
    guard let r = root else { return true }
    
    let left = height(r.left)
    let right = height(r.right)
    
    return abs(left-right) < 2 && isBalanced2(r.left) && isBalanced2(r.right)
}

func height(_ node: TreeNode?) -> Int {
    guard let n = node else { return -1 }
    
    let right = height(n.left)
    let left = height(n.right)
    
    return 1 + max(right, left)
}

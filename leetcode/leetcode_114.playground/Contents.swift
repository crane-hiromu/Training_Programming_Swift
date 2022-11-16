import UIKit

/*
 Given the root of a binary tree, flatten the tree into a "linked list":

 The "linked list" should use the same TreeNode class where the right child pointer points to the next node in the list and the left child pointer is always null.
 The "linked list" should be in the same order as a pre-order traversal of the binary tree.
  
 Example 1:
 Input: root = [1,2,5,3,4,null,6]
 Output: [1,null,2,null,3,null,4,null,5,null,6]
 
 Example 2:
 Input: root = []
 Output: []
 
 Example 3:
 Input: root = [0]
 Output: [0]
  
 Constraints:
 The number of nodes in the tree is in the range [0, 2000].
 -100 <= Node.val <= 100
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
func flatten(_ root: TreeNode?) {
    if root?.right == nil && root?.left == nil { return }
    
    var nodes = [TreeNode]()
    dfs(node: root, current: &nodes)
    
    var last: TreeNode? = root
    
    for node in nodes {
        node.right = nil
        node.left = nil
        
        last?.right = node
        last = node
    }
}

func dfs(node: TreeNode?, current: inout [TreeNode]) {
    guard let n = node else { return }
    current.append(n)
    dfs(node: n.left, current: &current)
    dfs(node: n.right, current: &current)
}

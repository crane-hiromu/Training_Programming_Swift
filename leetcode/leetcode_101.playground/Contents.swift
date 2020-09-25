import UIKit

/*
 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
 For example, this binary tree [1,2,2,3,4,4,3] is symmetric:

     1
    / \
   2   2
  / \ / \
 3  4 4  3
  

 But the following [1,2,2,null,3,null,3] is not:

     1
    / \
   2   2
    \   \
    3    3
  

 Follow up: Solve it both recursively and iteratively.
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

/// answer
func isSymmetric(_ root: TreeNode?) -> Bool {
    return isMirror(root, root)
}

func isMirror(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
    if left == nil && right == nil { return true }
    if left == nil || right == nil { return false }
    
    return left?.val == right?.val
        && isMirror(left?.left, right?.right)
        && isMirror(left?.right, right?.left)
}

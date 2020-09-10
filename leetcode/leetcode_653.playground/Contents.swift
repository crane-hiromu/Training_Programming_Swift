import UIKit

/*
 Given a Binary Search Tree and a target number, return true if there exist two elements in the BST such that their sum is equal to the given target.

 Example 1:

 Input:
     5
    / \
   3   6
  / \   \
 2   4   7

 Target = 9
 Output: True
  
 Example 2:

 Input:
     5
    / \
   3   6
  / \   \
 2   4   7

 Target = 28
 Output: False
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

/// answer1 ( from solution - hash)
func findTarget1(_ root: TreeNode?, _ k: Int) -> Bool {
    var hash = Set<Int>()
    return find1(root, k, &hash)
}

func find1(_ root: TreeNode?, _ k: Int, _ vals: inout Set<Int>) -> Bool {
    guard let r = root else { return false }
    
    /// 差分が含まれていた段階でtrueが確定する
    if vals.contains(k-r.val) {
        return true
    } else {
        vals.insert(r.val)
        return find1(r.left, k, &vals) || find1(r.right, k, &vals)
    }
}

/// answer2

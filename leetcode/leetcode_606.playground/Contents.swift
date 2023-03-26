import UIKit

/*
 Given the root of a binary tree, construct a string consisting of parenthesis and integers from a binary tree with the preorder traversal way, and return it.
 Omit all the empty parenthesis pairs that do not affect the one-to-one mapping relationship between the string and the original binary tree.

 Example 1:
 Input: root = [1,2,3,4]
 Output: "1(2(4))(3)"
 Explanation: Originally, it needs to be "1(2(4)())(3()())", but you need to omit all the unnecessary empty parenthesis pairs. And it will be "1(2(4))(3)"
 
 Example 2:
 Input: root = [1,2,3,null,4]
 Output: "1(2()(4))(3)"
 Explanation: Almost the same as the first example, except we cannot omit the first parenthesis pair to break the one-to-one mapping relationship between the input and the output.
  
 Constraints:
 The number of nodes in the tree is in the range [1, 104].
 -1000 <= Node.val <= 1000
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

class Solution {
    func tree2str(_ root: TreeNode?) -> String {
        inorder(next: root)
    }

    func inorder(next node: TreeNode?) -> String {
        guard let n = node else { return "" }
        if n.left == nil && n.right == nil { return "\(n.val)" }
        if n.right == nil { return "\(n.val)" + "(" + inorder(next: n.left) + ")" }
        return "\(n.val)" + "(" + inorder(next: n.left) + ")(" + inorder(next: n.right) + ")"
    }
}

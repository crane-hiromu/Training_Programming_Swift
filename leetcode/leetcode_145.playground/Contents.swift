import UIKit

/*
 Given the root of a binary tree, return the postorder traversal of its nodes' values.

 Example 1:
 Input: root = [1,null,2,3]
 Output: [3,2,1]
 
 Example 2:
 Input: root = []
 Output: []
 
 Example 3:
 Input: root = [1]
 Output: [1]
 
 Example 4:
 Input: root = [1,2]
 Output: [2,1]
 
 Example 5:
 Input: root = [1,null,2]
 Output: [2,1]
  
 Constraints:
 The number of the nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100
  
 Follow up: Recursive solution is trivial, could you do it iteratively?
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

func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    postorder(root, &result)
    return result
}

func postorder(_ node: TreeNode?, _ result: inout [Int]) {
    guard let n = node else { return }
    
    postorder(n.left, &result)
    postorder(n.right, &result)
    result.append(n.val)
}

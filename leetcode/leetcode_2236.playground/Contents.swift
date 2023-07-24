import UIKit

/*
 You are given the root of a binary tree that consists of exactly 3 nodes: the root, its left child, and its right child.
 Return true if the value of the root is equal to the sum of the values of its two children, or false otherwise.

 Example 1:
 Input: root = [10,4,6]
 Output: true
 Explanation: The values of the root, its left child, and its right child are 10, 4, and 6, respectively.
 10 is equal to 4 + 6, so we return true.
 
 Example 2:
 Input: root = [5,3,1]
 Output: false
 Explanation: The values of the root, its left child, and its right child are 5, 3, and 1, respectively.
 5 is not equal to 3 + 1, so we return false.
  
 Constraints:
 The tree consists only of the root, its left child, and its right child.
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

class Solution {
   func checkTree(_ root: TreeNode?) -> Bool {
       root?.val == (root?.left?.val ?? 0) + (root?.right?.val ?? 0)
   }
}

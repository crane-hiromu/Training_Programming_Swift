/*
 You are given the root of a binary search tree (BST), where the values of exactly two nodes of the tree were swapped by mistake. Recover the tree without changing its structure.
 
 Example 1:
 Input: root = [1,3,null,null,2]
 Output: [3,1,null,null,2]
 Explanation: 3 cannot be a left child of 1 because 3 > 1. Swapping 1 and 3 makes the BST valid.
 
 Example 2:
 Input: root = [3,1,4,null,null,2]
 Output: [2,1,4,null,null,3]
 Explanation: 2 cannot be in the right subtree of 3 because 2 < 3. Swapping 2 and 3 makes the BST valid.
  
 Constraints:
 The number of nodes in the tree is in the range [2, 1000].
 -231 <= Node.val <= 231 - 1
 */

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    var lhs: TreeNode?, rhs: TreeNode?, prev: TreeNode?
    
    func recoverTree(_ root: TreeNode?) {
        dfs(root)
        swap(lhs: &lhs, rhs: &rhs)
    }
    
    func dfs(_ root: TreeNode?) {
        guard let node = root else { return }
        
        dfs(node.left)
                
        if lhs == nil, let prev = prev, prev.val > node.val { lhs = prev }
        if lhs != nil, rhs == nil || node.val < rhs!.val { rhs = node }
        prev = node
        
        dfs(node.right)
    }
    
    func swap(lhs: inout TreeNode?, rhs: inout TreeNode?) {
        guard let lhs = lhs, let rhs = rhs else { return }
        
        let tmp = lhs.val
        lhs.val = rhs.val
        rhs.val = tmp
    }
}

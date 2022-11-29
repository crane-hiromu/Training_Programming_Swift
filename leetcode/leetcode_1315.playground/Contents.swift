import UIKit

/*
 Given the root of a binary tree, return the sum of values of nodes with an even-valued grandparent. If there are no nodes with an even-valued grandparent, return 0.

 A grandparent of a node is the parent of its parent if it exists.

 Example 1:
 Input: root = [6,7,8,2,7,1,3,9,null,1,4,null,null,null,5]
 Output: 18
 Explanation: The red nodes are the nodes with even-value grandparent while the blue nodes are the even-value grandparents.
 
 Example 2:
 Input: root = [1]
 Output: 0
  
 Constraints:
 The number of nodes in the tree is in the range [1, 104].
 1 <= Node.val <= 100
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

// dfs
class Solution {
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        var sum = 0
        dfs(next: root, sum: &sum)
        return sum
    }
    
    func dfs(next node: TreeNode?, sum: inout Int) {
        guard let n = node else { return }
        
        if n.val % 2 == 0 {
            let grandChildren = [n.left?.left, n.left?.right, n.right?.left, n.right?.right]
            
            for node in grandChildren {
                sum += node?.val ?? 0
            }
        }
        
        dfs(next: n.left, sum: &sum)
        dfs(next: n.right, sum: &sum)
    }
}

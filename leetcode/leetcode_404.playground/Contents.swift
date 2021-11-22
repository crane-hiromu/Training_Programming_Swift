import UIKit

/*
 Given the root of a binary tree, return the sum of all left leaves.

 Example 1:
 Input: root = [3,9,20,null,null,15,7]
 Output: 24
 Explanation: There are two left leaves in the binary tree, with values 9 and 15 respectively.
 
 Example 2:
 Input: root = [1]
 Output: 0
  
 Constraints:
 The number of nodes in the tree is in the range [1, 1000].
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

func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    guard let r = root else { return 0 }
    
    var queue: [(TreeNode, Bool)] = [(r, false)], result = 0
    
    while !queue.isEmpty {
        let node = queue.removeFirst()

        // 左に落ちている末端のnodeの場合のみ値を追加
        if node.0.left == nil, node.0.right == nil, node.1 {
            result += node.0.val
        }
        if let left = node.0.left {
            queue.append((left, true))
        }
        if let right = node.0.right {
            queue.append((right, false))
        }
    }
    
    return result
}

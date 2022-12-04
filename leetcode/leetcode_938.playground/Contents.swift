import UIKit

/*
 Given the root node of a binary search tree and two integers low and high, return the sum of values of all nodes with a value in the inclusive range [low, high].
 
 Example 1:
 Input: root = [10,5,15,3,7,null,18], low = 7, high = 15
 Output: 32
 Explanation: Nodes 7, 10, and 15 are in the range [7, 15]. 7 + 10 + 15 = 32.
 
 Example 2:
 Input: root = [10,5,15,3,7,13,18,1,null,6], low = 6, high = 10
 Output: 23
 Explanation: Nodes 6, 7, and 10 are in the range [6, 10]. 6 + 7 + 10 = 23.
  
 Constraints:
 The number of nodes in the tree is in the range [1, 2 * 104].
 1 <= Node.val <= 105
 1 <= low <= high <= 105
 All Node.val are unique.
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

// BST
class Solution {
    
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let r = root else { return 0 }
        
        var queues = [r]
        var sum = 0
        
        while !queues.isEmpty {
            let queue = queues.removeFirst()
            
            if low...high ~= queue.val {
                sum += queue.val
            }
            if let l = queue.left {
                queues.append(l)
            }
            if let r = queue.right {
                queues.append(r)
            }
        }
        
        return sum
    }
}

// DFS
class Solution2 {
    
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let n = root else { return 0 }
        
        var sum = (low...high).contains(n.val) ? n.val : 0
        sum += rangeSumBST(n.left, low, high)
        sum += rangeSumBST(n.right, low, high)
        return sum
    }
}

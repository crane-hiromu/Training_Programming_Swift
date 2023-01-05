import UIKit

/*
 Given the root of a binary tree, return an array of the largest value in each row of the tree (0-indexed).

 Example 1:
 Input: root = [1,3,2,5,3,null,9]
 Output: [1,3,9]
 
 Example 2:
 Input: root = [1,2,3]
 Output: [1,3]
  
 Constraints:
 The number of nodes in the tree will be in the range [0, 104].
 -231 <= Node.val <= 231 - 1
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

// BFS
class Solution {
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let r = root else { return [] }

        var queues = [r]
        var result = [Int]()

        while !queues.isEmpty {
            var _queues = queues
            var nums = [Int]()

            for _ in _queues {
                let queue = queues.removeFirst()
                nums.append(queue.val)
                if let q = queue.left { queues.append(q) }
                if let q = queue.right { queues.append(q) }
            }
            result.append(nums.max()!)
        }
        return result
    }
}

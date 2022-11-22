import UIKit

/*
 Given the root of a complete binary tree, return the number of the nodes in the tree.
 According to Wikipedia, every level, except possibly the last, is completely filled in a complete binary tree, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.
 Design an algorithm that runs in less than O(n) time complexity.

 Example 1:
 Input: root = [1,2,3,4,5,6]
 Output: 6
 
 Example 2:
 Input: root = []
 Output: 0
 
 Example 3:
 Input: root = [1]
 Output: 1
  
 Constraints:
 The number of nodes in the tree is in the range [0, 5 * 104].
 0 <= Node.val <= 5 * 104
 The tree is guaranteed to be complete.
 */

// bfs
func countNodes(_ root: TreeNode?) -> Int {
    guard let r = root else { return 0 }
    
    var counter = 1
    var queues = [r]
    
    while !queues.isEmpty {
        let node = queues.removeFirst()
        
        if let left = node.left {
            queues.append(left)
            counter += 1
        }
        if let right = node.right {
            queues.append(right)
            counter += 1
        }
    }
    
    return counter
}

// dfs
class Solution1 {
    func countNodes(_ root: TreeNode?) -> Int {
        var counter = 0
        dfs(next: root, counter: &counter)
        return counter
    }
    
    func dfs(next node: TreeNode?, counter: inout Int) {
        guard let n = node else { return }
        counter += 1
        dfs(next: n.left, counter: &counter)
        dfs(next: n.right, counter: &counter)
    }
}

class Solution2 {
    func countNodes(_ root: TreeNode?) -> Int {
        guard let r = root else { return 0 }
        return countNodes(r.left) + countNodes(r.right) + 1
    }
}

import UIKit

/*
 Given the root of a binary search tree (BST) with duplicates, return all the mode(s) (i.e., the most frequently occurred element) in it.
 If the tree has more than one mode, return them in any order.

 Assume a BST is defined as follows:
 The left subtree of a node contains only nodes with keys less than or equal to the node's key.
 The right subtree of a node contains only nodes with keys greater than or equal to the node's key.
 Both the left and right subtrees must also be binary search trees.
  
 Example 1:
 Input: root = [1,null,2,2]
 Output: [2]
 
 Example 2:
 Input: root = [0]
 Output: [0]
  
 Constraints:
 The number of nodes in the tree is in the range [1, 104].
 -105 <= Node.val <= 105

 Follow up: Could you do that without using any extra space? (Assume that the implicit stack space incurred due to recursion does not count).
 */

// BFS
func findMode(_ root: TreeNode?) -> [Int] {
    guard let r = root else { return [] }
    
    var dict = [Int:Int]()
    var queues = [r]
    var maximum = 0
    
    while !queues.isEmpty {
        let queue = queues.removeFirst()
        
        dict[queue.val, default: 0] += 1
        maximum = max(maximum, dict[queue.val]!)
        
        if let l = queue.left {
            queues.append(l)
        }
        if let r = queue.right {
            queues.append(r)
        }
    }
            
    return Array(dict.filter { $0.value == maximum }.keys)
}

// DFS
class Solution {
    func findMode(_ root: TreeNode?) -> [Int] {
        var maximum = 0
        var hashmap = [Int: Int]()
        dfs(next: root, hashmap: &hashmap, maximum: &maximum)
        return Array(hashmap.filter { $0.value == maximum }.keys)
    }
    
    func dfs(next node: TreeNode?, hashmap: inout [Int: Int], maximum: inout Int) {
        guard let n = node else { return }
        
        hashmap[n.val, default: 0] += 1
        maximum = max(maximum, hashmap[n.val]!)
        
        dfs(next: n.left, hashmap: &hashmap, maximum: &maximum)
        dfs(next: n.right, hashmap: &hashmap, maximum: &maximum)
    }
}

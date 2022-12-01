/*
 Given the root of a binary tree, return the number of nodes where the value of the node is equal to the average of the values in its subtree.

 Note:
 The average of n elements is the sum of the n elements divided by n and rounded down to the nearest integer.
 A subtree of root is a tree consisting of root and all of its descendants.
  
 Example 1:
 Input: root = [4,8,5,0,1,null,6]
 Output: 5
 Explanation:
 For the node with value 4: The average of its subtree is (4 + 8 + 5 + 0 + 1 + 6) / 6 = 24 / 6 = 4.
 For the node with value 5: The average of its subtree is (5 + 6) / 2 = 11 / 2 = 5.
 For the node with value 0: The average of its subtree is 0 / 1 = 0.
 For the node with value 1: The average of its subtree is 1 / 1 = 1.
 For the node with value 6: The average of its subtree is 6 / 1 = 6.
 
 Example 2:
 Input: root = [1]
 Output: 1
 Explanation: For the node with value 1: The average of its subtree is 1 / 1 = 1.
  
 Constraints:
 The number of nodes in the tree is in the range [1, 1000].
 0 <= Node.val <= 1000
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
    func averageOfSubtree(_ root: TreeNode?) -> Int {
        guard let r = root else { return 0 }
        
        var result = 0
        bfs(root: r, result: &result)
        return result
    }
    
    func bfs(root: TreeNode, result: inout Int) {
        var queues: [TreeNode] = [root]
        
        while !queues.isEmpty {
            let node = queues.removeFirst()
            
            if let l = node.left {
                queues.append(l)
            }
            if let r = node.right {
                queues.append(r)
            }
            
            var sum = 0, counter = 1
            dfs(next: node, counter: &counter, sum: &sum)
            
            if sum / counter == node.val {
                result += 1
            }
        }
    }
    
    func dfs(next node: TreeNode, counter: inout Int, sum: inout Int) {
        sum += node.val
        
        if let l = node.left {
            counter += 1
            dfs(next: l, counter: &counter, sum: &sum)
        }
        if let r = node.right {
            counter += 1
            dfs(next: r, counter: &counter, sum: &sum)
        }
    }
}

// DFS
class Solution2 {
    func averageOfSubtree(_ root: TreeNode?) -> Int {
        dfs(next: root).result
    }
        
    func dfs(next node: TreeNode?) -> (sum: Int, count: Int, result: Int) {
        guard let n = node else { return (sum: 0, count: 0, result: 0) }
        
        let left = dfs(next: n.left)
        let right = dfs(next: n.right)
        
        let sum = n.val + left.sum + right.sum
        let count = 1 + left.count + right.count
        var result = left.result + right.result
        
        if sum / count == n.val {
            result += 1
        }
        
        return (sum: n.val + left.sum + right.sum,
                count: 1 + left.count + right.count,
                result: result)
    }
}

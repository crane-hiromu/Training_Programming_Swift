import UIKit

/*
 Given two binary search trees root1 and root2, return a list containing all the integers from both trees sorted in ascending order.

 Example 1:
 Input: root1 = [2,1,4], root2 = [1,0,3]
 Output: [0,1,1,2,3,4]
 
 Example 2:
 Input: root1 = [1,null,8], root2 = [8,1]
 Output: [1,1,8,8]
  
 Constraints:
 The number of nodes in each tree is in the range [0, 5000].
 -105 <= Node.val <= 105
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
func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
    var queues = [TreeNode]()
    var nums = [Int]()
    
    if let r1 = root1 { queues.append(r1) }
    if let r2 = root2 { queues.append(r2) }
    
    while !queues.isEmpty {
        let queue = queues.removeFirst()
        nums.append(queue.val)
        
        if let l = queue.left { queues.append(l) }
        if let r = queue.right { queues.append(r) }
    }
    
    return nums.sorted()
}

// DFS preorder
class Solution {
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        var nums = [Int]()
        dfs(next: root1, nums: &nums)
        dfs(next: root2, nums: &nums)
        return nums.sorted()
    }
    
    func dfs(next node: TreeNode?, nums: inout [Int]) {
        guard let n = node else { return }
        nums.append(n.val)
        dfs(next: n.left, nums: &nums)
        dfs(next: n.right, nums: &nums)
    }
}

// DFS postorder
class Solution {
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        var nums = [Int]()
        nums += dfs(next: root1)
        nums += dfs(next: root2)
        return nums.sorted()
    }
    
    func dfs(next node: TreeNode?) -> [Int] {
        guard let n = node else { return [] }
        
        var nums = [n.val]
        nums += dfs(next: n.left)
        nums += dfs(next: n.right)
        return nums
    }
}

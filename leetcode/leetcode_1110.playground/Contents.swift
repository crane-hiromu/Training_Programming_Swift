import UIKit

/*
 Given the root of a binary tree, each node in the tree has a distinct value.
 After deleting all nodes with a value in to_delete, we are left with a forest (a disjoint union of trees).
 Return the roots of the trees in the remaining forest. You may return the result in any order.

 Example 1:
 Input: root = [1,2,3,4,5,6,7], to_delete = [3,5]
 Output: [[1,2,null,4],[6],[7]]
 
 Example 2:
 Input: root = [1,2,4,null,3], to_delete = [3]
 Output: [[1,2,4]]
  
 Constraints:
 The number of nodes in the given tree is at most 1000.
 Each node has a distinct value between 1 and 1000.
 to_delete.length <= 1000
 to_delete contains distinct values between 1 and 1000.
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

// DFS(Preorder)
class Solution {
    func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        var target = root, nums = to_delete, result = [TreeNode]()
        if let n = root, !nums.contains(n.val) { result.append(n) }
        dfs(target: &target, nums: &nums, result: &result)
        return result
    }

    func dfs(target: inout TreeNode?, nums: inout [Int], result: inout [TreeNode]) {
        guard !nums.isEmpty, var node = target else { return }

        for i in 0..<nums.count where nums[i] == node.val {
            nums.remove(at: i)
            if let l = node.left, !nums.contains(l.val) { result.append(l) }
            if let r = node.right, !nums.contains(r.val) { result.append(r) }
            target = nil
            break
        }
        dfs(target: &node.left, nums: &nums, result: &result)
        dfs(target: &node.right, nums: &nums, result: &result)
    }
}

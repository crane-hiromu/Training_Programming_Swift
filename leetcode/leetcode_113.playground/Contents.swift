import UIKit

/*
 Given the root of a binary tree and an integer targetSum, return all root-to-leaf paths where the sum of the node values in the path equals targetSum. Each path should be returned as a list of the node values, not node references.
 A root-to-leaf path is a path starting from the root and ending at any leaf node. A leaf is a node with no children.

 Example 1:
 Input: root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
 Output: [[5,4,11,2],[5,8,4,5]]
 Explanation: There are two paths whose sum equals targetSum:
 5 + 4 + 11 + 2 = 22
 5 + 8 + 4 + 5 = 22
 
 Example 2:
 Input: root = [1,2,3], targetSum = 5
 Output: []
 
 Example 3:
 Input: root = [1,2], targetSum = 0
 Output: []
  
 Constraints:
 The number of nodes in the tree is in the range [0, 5000].
 -1000 <= Node.val <= 1000
 -1000 <= targetSum <= 1000
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

// DFS
func pathSum1(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
    var result = [[Int]]()
    pathSum1(root, sum, [], &result)
    return result
}
func pathSum1(_ root: TreeNode?, _ sum: Int, _ nums: [Int], _ result: inout [[Int]]) {
    guard let r = root else { return }
    
    let addedNums = nums+[r.val]
    
    // `leaf`の時に値を確認する
    if r.left == nil, r.right == nil, sum == addedNums.reduce(0, +) {
        result.append(addedNums)
    }
    pathSum1(r.left, sum, addedNums, &result)
    pathSum1(r.right, sum, addedNums, &result)
}

// BFS
func pathSum2(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
    guard let r = root else { return [] }
    
    // 例外：１つしかない場合
    if r.left == nil, r.right == nil {
        return sum == r.val ? [[r.val]] : []
    }

    var queue = [(node: r, nums: [Int]())], result = [[Int]]()
    
    while !queue.isEmpty {
        for _ in queue {
            let obj = queue.removeFirst()
            let nums = obj.nums + [obj.node.val]
            
            if obj.node.left == nil, obj.node.right == nil, nums.reduce(0, +) == sum {
                result.append(nums)
            }

            if let l = obj.node.left { queue.append((node: l, nums: nums)) }
            if let r = obj.node.right { queue.append((node: r, nums: nums)) }
        }
    }
    return result
}

import UIKit

/*
 Given the root of a binary tree and an integer targetSum, return true if the tree has a root-to-leaf path such that adding up all the values along the path equals targetSum.
 A leaf is a node with no children.

 Example 1:
 Input: root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
 Output: true
 
 Example 2:
 Input: root = [1,2,3], targetSum = 5
 Output: false
 
 Example 3:
 Input: root = [1,2], targetSum = 0
 Output: false
  
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
func hasPathSum1(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    hasPathSum1(root, targetSum, 0)
}

func hasPathSum1(_ root: TreeNode?, _ targetSum: Int, _ num: Int) -> Bool {
    guard let r = root else { return false }
    
    let sum = num + r.val
    
    // `leaf`があるか確認し、なければ合計値を満たす時だけ処理を終える
    if r.left == nil, r.right == nil, sum == targetSum {
        return true
    }
    // `left`or`right`いずれかが満たされれば良いので確認する
    return hasPathSum1(r.left, targetSum, sum) || hasPathSum1(r.right, targetSum, sum)
}

// BFS
func hasPathSum2(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    guard let r = root else { return false }
    
    var queue = [(node: r, num: 0)]
    
    while !queue.isEmpty {
        for _ in queue {
            let (node, num) = queue.removeFirst()
            let sum = node.val + num
            
            // `leaf`があるか確認し、なければ合計値を満たす時だけ処理を終える
            if node.left == nil, node.right == nil, sum == targetSum {
                return true
            }
            // `leaf`がある場合は処理を継続
            if let l = node.left {
                queue.append((node: l, num: sum))
            }
            if let r = node.right {
                queue.append((node: r, num: sum))
            }
        }
    }
    return false
}

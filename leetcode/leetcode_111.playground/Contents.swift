import UIKit

/*
 Given a binary tree, find its minimum depth.
 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
 Note: A leaf is a node with no children.

 Example 1:
 Input: root = [3,9,20,null,null,15,7]
 Output: 2
 
 Example 2:
 Input: root = [2,null,3,null,4,null,5,null,6]
 Output: 5
  
 Constraints:
 The number of nodes in the tree is in the range [0, 105].
 -1000 <= Node.val <= 1000
 Accepted
 654,588
 Submissions
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

// 再起関数
func minDepth1(_ root: TreeNode?) -> Int {
    guard let r = root else { return 0 }
    
    let left = minDepth(r.left)
    let right = minDepth(r.right)
    let minIndex = min(left, right)
    
    if minIndex == 0 {
        return max(left, right) + 1
    } else {
        return minIndex + 1
    }
}

// 幅優先探索だと遅いっぽい
func minDepth2(_ root: TreeNode?) -> Int {
    guard let r = root else { return 0 }
    
    var queue: [(TreeNode, Int)] = [(r, 1)], result = 1000000 // 仮の値だが設定しなくて済むなら無くしたい
    
    while !queue.isEmpty {
        let obj = queue.removeFirst()
        
        if obj.0.left == nil, obj.0.right == nil {
            result = min(result, obj.1)
        }
        if let l = obj.0.left {
            queue.append((l, obj.1+1))
        }
        if let r = obj.0.right {
            queue.append((r, obj.1+1))
        }
    }
    
    return result
}
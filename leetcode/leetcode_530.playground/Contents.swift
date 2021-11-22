import UIKit

/*
 Given the root of a Binary Search Tree (BST), return the minimum absolute difference between the values of any two different nodes in the tree.

 Example 1:
 Input: root = [4,2,6,1,3]
 Output: 1
 
 Example 2:
 Input: root = [1,0,48,null,null,12,49]
 Output: 1
  
 Constraints:
 The number of nodes in the tree is in the range [2, 104].
 0 <= Node.val <= 105
 */

// 783も同じ問題

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

func getMinimumDifference(_ root: TreeNode?) -> Int {
    guard let r = root else { return 0 }
    
    var queue = [r]
    var vals = [r.val]
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        
        if let l = node.left {
            queue.append(l)
            vals.append(l.val)
        }
        if let r = node.right {
            queue.append(r)
            vals.append(r.val)
        }
    }
    
    var result = Int.max
    for i in 0..<vals.count-1 {
        for j in i+1..<vals.count {
            result = min(result, abs(vals[i]-vals[j]))
        }
    }
    return result
}

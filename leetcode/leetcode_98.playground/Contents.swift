import UIKit

/*
 
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

// 1
func isValidBST(_ root: TreeNode?) -> Bool {
    return dfs(root, Int.min, Int.max)
}

func dfs(_ root: TreeNode?, _ low: Int, _ high: Int) -> Bool {
    guard let r = root else { return true }
    
    if r.val <= low || high <= r.val { return false }
    return dfs(r.left, low, r.val) && dfs(r.right, r.val, high)
}

// 2
func isValidBST2(_ root: TreeNode?) -> Bool {
    guard let r = root else { return true }
    
    var queue = [(node: r, min: Int.min, max: Int.max)]
    
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let obj = queue.removeFirst()
            
            if obj.node.val <= obj.min || obj.max <= obj.node.val { return false }
            
            // 左の場合は、最大値は現在のnode、最小値のそのまま
            if let l = obj.node.left {
                queue.append((node: l, min: obj.min, max: obj.node.val))
            }
            // 右の場合は、最大値のそのまま、最小値は現在のnode
            if let r = obj.node.right {
                queue.append((node: r, min: obj.node.val, max: obj.max))
            }
        }
    }
    return true
}

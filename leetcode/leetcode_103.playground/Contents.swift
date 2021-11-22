import UIKit

/*
 Given the root of a binary tree, return the zigzag level order traversal of its nodes' values. (i.e., from left to right, then right to left for the next level and alternate between).

 Example 1:
 Input: root = [3,9,20,null,null,15,7]
 Output: [[3],[20,9],[15,7]]
 
 Example 2:
 Input: root = [1]
 Output: [[1]]
 
 Example 3:
 Input: root = []
 Output: []
  
 Constraints:
 The number of nodes in the tree is in the range [0, 2000].
 -100 <= Node.val <= 100
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

func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    guard root != nil else { return [] }
    
    var result = [[Int]](), queue = [root], flag = true
    
    while !queue.isEmpty {
        var count = queue.count - 1
        var temp = [Int]()
        
        while 0 <= count {
            if let node = queue.removeFirst() {
                if flag {
                    temp.append(node.val)
                } else {
                    temp.insert(node.val, at: 0)
                }
                
                count -= 1
                
                if let l = node.left { queue.append(l) }
                if let r = node.right { queue.append(r) }
            }
        }
        result.append(temp)
        flag.toggle()
    }
    return result
}

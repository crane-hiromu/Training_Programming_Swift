import UIKit

/*
 Given the root of a binary search tree, rearrange the tree in in-order so that the leftmost node in the tree is now the root of the tree, and every node has no left child and only one right child.

 Example 1:
 Input: root = [5,3,6,2,4,null,8,1,null,null,null,7,9]
 Output: [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]
 
 Example 2:
 Input: root = [5,1,7]
 Output: [1,null,5,null,7]
  
 Constraints:
 The number of nodes in the given tree will be in the range [1, 100].
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

func increasingBST(_ root: TreeNode?) -> TreeNode? {
    var nums = [Int]()
    inorder(root, nums: &nums)

    var previous: TreeNode?
    nums.forEach { previous = TreeNode($0, nil, previous) }
    
    return previous
}

func inorder(_ node: TreeNode?, nums: inout [Int]) {
    guard let n = node else { return }
    
    inorder(n.right, nums: &nums)
    nums.append(n.val)
    inorder(n.left, nums: &nums)
}

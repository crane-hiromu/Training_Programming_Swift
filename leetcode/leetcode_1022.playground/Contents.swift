import UIKit

/*
 You are given the root of a binary tree where each node has a value 0 or 1. Each root-to-leaf path represents a binary number starting with the most significant bit.

 For example, if the path is 0 -> 1 -> 1 -> 0 -> 1, then this could represent 01101 in binary, which is 13.
 For all leaves in the tree, consider the numbers represented by the path from the root to that leaf. Return the sum of these numbers.

 The test cases are generated so that the answer fits in a 32-bits integer.

 Example 1:
 Input: root = [1,0,1,0,1,0,1]
 Output: 22
 Explanation: (100) + (101) + (110) + (111) = 4 + 5 + 6 + 7 = 22
 
 Example 2:
 Input: root = [0]
 Output: 0
  
 Constraints:
 The number of nodes in the tree is in the range [1, 1000].
 Node.val is 0 or 1.
 */

// dfs
class Solution {
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        var sum = 0
        preorder(next: root, current: "", sum: &sum)
        return sum
    }

    func preorder(next node: TreeNode?, current: String, sum: inout Int) {
        guard let n = node else { return }
        var val = current
        val += "\(n.val)"

        preorder(next: n.left, current: val, sum: &sum)
        preorder(next: n.right, current: val, sum: &sum)

        guard n.left == nil, n.right == nil else { return }
        sum += Int(val, radix: 2)!
    }
}

// dfs + bit
class Solution2 {
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        var sum = 0
        preorder(next: root, current: 0, sum: &sum)
        return sum
    }

    func preorder(next node: TreeNode?, current: Int, sum: inout Int) {
        guard let n = node else { return }
        let val = current << 1 | n.val

        preorder(next: n.left, current: val, sum: &sum)
        preorder(next: n.right, current: val, sum: &sum)

        guard n.left == nil, n.right == nil else { return }
        sum += val
    }
}

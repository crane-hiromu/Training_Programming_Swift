import UIKit

/*
 Given a binary tree where node values are digits from 1 to 9. A path in the binary tree is said to be pseudo-palindromic if at least one permutation of the node values in the path is a palindrome.
 Return the number of pseudo-palindromic paths going from the root node to leaf nodes.

 Example 1:
 Input: root = [2,3,1,3,1,null,1]
 Output: 2
 Explanation: The figure above represents the given binary tree. There are three paths going from the root node to leaf nodes: the red path [2,3,3], the green path [2,1,1], and the path [2,3,1]. Among these paths only red path and green path are pseudo-palindromic paths since the red path [2,3,3] can be rearranged in [3,2,3] (palindrome) and the green path [2,1,1] can be rearranged in [1,2,1] (palindrome).
 
 Example 2:
 Input: root = [2,1,1,1,3,null,null,null,null,null,1]
 Output: 1
 Explanation: The figure above represents the given binary tree. There are three paths going from the root node to leaf nodes: the green path [2,1,1], the path [2,1,3,1], and the path [2,1]. Among these paths only the green path is pseudo-palindromic since [2,1,1] can be rearranged in [1,2,1] (palindrome).
 
 Example 3:
 Input: root = [9]
 Output: 1
  
 Constraints:
 The number of nodes in the tree is in the range [1, 105].
 1 <= Node.val <= 9
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

// dfs + hash
class Solution {
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        var nums = [[Int: Bool]]()
        preorder(next: root, current: [:], nums: &nums)

        // check palindrome
        let result = nums.filter {
            let nums = $0.filter { $0.value }
            return nums.isEmpty || nums.count == 1
        }

        return result.count
    }

    func preorder(next node: TreeNode?, current: [Int: Bool], nums: inout [[Int: Bool]]) {
        guard let n = node else { return }

        var _current = current
        if let flag = _current[n.val], flag {
            _current[n.val] = false
        } else {
            _current[n.val] = true
        }

        if n.left == nil, n.right == nil {
            nums.append(_current)
        }
        
        preorder(next: n.left, current: _current, nums: &nums)
        preorder(next: n.right, current: _current, nums: &nums)
    }
}

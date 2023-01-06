import UIKit

/*
 A complete binary tree is a binary tree in which every level, except possibly the last, is completely filled, and all nodes are as far left as possible.
 Design an algorithm to insert a new node to a complete binary tree keeping it complete after the insertion.

 Implement the CBTInserter class:
 CBTInserter(TreeNode root) Initializes the data structure with the root of the complete binary tree.
 int insert(int v) Inserts a TreeNode into the tree with value Node.val == val so that the tree remains complete, and returns the value of the parent of the inserted TreeNode.
 TreeNode get_root() Returns the root node of the tree.
  
 Example 1:
 Input
 ["CBTInserter", "insert", "insert", "get_root"]
 [[[1, 2]], [3], [4], []]
 Output
 [null, 1, 2, [1, 2, 3, 4]]

 Explanation
 CBTInserter cBTInserter = new CBTInserter([1, 2]);
 cBTInserter.insert(3);  // return 1
 cBTInserter.insert(4);  // return 2
 cBTInserter.get_root(); // return [1, 2, 3, 4]
  
 Constraints:
 The number of nodes in the tree will be in the range [1, 1000].
 0 <= Node.val <= 5000
 root is a complete binary tree.
 0 <= val <= 5000
 At most 104 calls will be made to insert and get_root.
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

// BFS
class CBTInserter {

    var root: TreeNode
    
    init(_ root: TreeNode?) {
        self.root = root!
    }
    
    func insert(_ val: Int) -> Int {
        var queues = [root]

        while !queues.isEmpty {
            var queue = queues.removeFirst()

            if let q = queue.left {
                queues.append(q)
            } else {
                queue.left = TreeNode(val)
                return queue.val
            }
            if let q = queue.right {
                queues.append(q)
            } else {
                queue.right = TreeNode(val)
                return queue.val
            }
        }
        return 0
    }
    
    func get_root() -> TreeNode? {
        return root
    }
}

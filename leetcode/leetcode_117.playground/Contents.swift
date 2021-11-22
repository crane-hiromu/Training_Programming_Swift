import UIKit

/*
 Given a binary tree

 struct Node {
   int val;
   Node *left;
   Node *right;
   Node *next;
 }
 Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.

 Initially, all next pointers are set to NULL.

 Example 1:
 Input: root = [1,2,3,4,5,null,7]
 Output: [1,#,2,3,#,4,5,7,#]
 Explanation: Given the above binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.
 
 Example 2:
 Input: root = []
 Output: []
  
 Constraints:
 The number of nodes in the tree is in the range [0, 6000].
 -100 <= Node.val <= 100
  
 Follow-up:
 You may only use constant extra space.
 The recursive approach is fine. You may assume implicit stack space does not count as extra space for this problem.
 */

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

// 116と同じ解放

func connect(_ root: Node?) -> Node? {
    guard root != nil else { return nil }
    
    var queue = [root]
    
    while !queue.isEmpty {
        var count = queue.count - 1
        var temp = [Node]()
        
        while 0 <= count {
            if let node = queue.removeFirst() {
                temp.append(node)
                count -= 1
                if let l = node.left { queue.append(l) }
                if let r = node.right { queue.append(r) }
            }
        }
        
        for i in (0..<temp.count-1) {
            temp[i].next = temp[i+1]
        }
    }
    return root
}

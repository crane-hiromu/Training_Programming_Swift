import UIKit

/*
 You are given a doubly linked list, which contains nodes that have a next pointer, a previous pointer, and an additional child pointer. This child pointer may or may not point to a separate doubly linked list, also containing these special nodes. These child lists may have one or more children of their own, and so on, to produce a multilevel data structure as shown in the example below.

 Given the head of the first level of the list, flatten the list so that all the nodes appear in a single-level, doubly linked list. Let curr be a node with a child list. The nodes in the child list should appear after curr and before curr.next in the flattened list.

 Return the head of the flattened list. The nodes in the list must have all of their child pointers set to null.

 Example 1:
 Input: head = [1,2,3,4,5,6,null,null,null,7,8,9,10,null,null,11,12]
 Output: [1,2,3,7,8,11,12,9,10,4,5,6]
 Explanation: The multilevel linked list in the input is shown.
 After flattening the multilevel linked list it becomes:

 Example 2:
 Input: head = [1,2,null,3]
 Output: [1,3,2]
 Explanation: The multilevel linked list in the input is shown.
 After flattening the multilevel linked list it becomes:

 Example 3:
 Input: head = []
 Output: []
 Explanation: There could be empty list in the input.
  
 Constraints:
 The number of Nodes will not exceed 1000.
 1 <= Node.val <= 105
 */

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var prev: Node?
 *     public var next: Node?
 *     public var child: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.prev = nil
 *         self.next = nil
 *         self.child  = nil
 *     }
 * }
 */ 

func flatten(_ head: Node?) -> Node? {
    guard let h = head else { return nil }
    if h.prev == nil && h.next == nil && h.child == nil { return h }
    
    var nodes = [Node]()
    dfs(node: h, current: &nodes)
    
    var last: Node?

    for node in nodes {
        node.prev = last
        node.next = nil
        node.child = nil

        last?.next = node
        last?.child = nil
        last = node
    }
    
    return head
}

func dfs(node: Node?, current: inout [Node]) {
    guard let n = node else { return }
    current.append(n)
    dfs(node: n.child, current: &current)
    dfs(node: n.next, current: &current)
}

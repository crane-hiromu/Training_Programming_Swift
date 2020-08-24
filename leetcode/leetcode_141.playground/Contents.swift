import UIKit

/*
 Given a linked list, determine if it has a cycle in it.
 To represent a cycle in the given linked list, we use an integer pos which represents the position (0-indexed) in the linked list where tail connects to. If pos is -1, then there is no cycle in the linked list.

 Example 1:
 Input: head = [3,2,0,-4], pos = 1
 Output: true
 Explanation: There is a cycle in the linked list, where tail connects to the second node.

 Example 2:
 Input: head = [1,2], pos = 0
 Output: true
 Explanation: There is a cycle in the linked list, where tail connects to the first node.

 Example 3:
 Input: head = [1], pos = -1
 Output: false
 Explanation: There is no cycle in the linked list.

 Follow up:
 Can you solve it using O(1) (i.e. constant) memory?
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/// answer1
/// ListNodeがHashableやEquatableを継承していないので、仕方なく次のNodeの値を保存して比較している
func hasCycle1(_ head: ListNode?) -> Bool {
    var hashTable = [Int: Int](), current = head
    
    while let c = current {
        /// ループしているか確認
        if let val = hashTable[c.val], val == c.next?.val {
            return true
        } else if let n = c.next {
            hashTable[c.val] = n.val
        } else {
            return false
        }
        
        current = c.next
    }
    return false
}

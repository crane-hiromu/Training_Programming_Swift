import UIKit

/*
 Given a non-empty, singly linked list with head node head, return a middle node of linked list.
 If there are two middle nodes, return the second middle node.

 Example 1:
 Input: [1,2,3,4,5]
 Output: Node 3 from this list (Serialization: [3,4,5])
 The returned node has value 3.  (The judge's serialization of this node is [3,4,5]).
 Note that we returned a ListNode object ans, such that:
 ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, and ans.next.next.next = NULL.
 
 Example 2:
 Input: [1,2,3,4,5,6]
 Output: Node 4 from this list (Serialization: [4,5,6])
 Since the list has two middle nodes with values 3 and 4, we return the second one.
  
 Note:
 The number of nodes in the given list will be between 1 and 100.
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

// answer1
func middleNode1(_ head: ListNode?) -> ListNode? {
    var dict = [Int: ListNode]()
    var counter = 0
    var current = head
    
    while let node = current {
        dict[counter] = node
        current = node.next
        counter += 1
    }
    
    return dict[dict.count/2]
}

// answer2
func middleNode2(_ head: ListNode?) -> ListNode? {
    var slow = head, fast = head
    
    while fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    return slow
}

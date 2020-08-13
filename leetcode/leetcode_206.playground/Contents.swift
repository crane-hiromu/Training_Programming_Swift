import UIKit

/*
 Reverse a singly linked list.

 Example:

 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 Follow up:

 A linked list can be reversed either iteratively or recursively. Could you implement both?
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


/// answer1
func reverseList1(_ head: ListNode?) -> ListNode? {
    guard head != nil else { return nil }
    
    var current = head
    var vals: [Int] = [head!.val]
    
    while let next = current?.next {
        vals.append(next.val)
        current = next
    }
    
    var last: ListNode? = nil
    for n in vals {
        let node = ListNode()
        node.val = n
        node.next = last
        last = node
    }

    return last
}

/// answer2 ( from solution)
func reverseList2(_ head: ListNode?) -> ListNode? {
    var prev: ListNode? = nil
    var curr: ListNode? = head
    
    while let c = curr {
        let next = c.next
        curr?.next = prev
        prev = curr
        curr = next
    }
    
    return prev
}

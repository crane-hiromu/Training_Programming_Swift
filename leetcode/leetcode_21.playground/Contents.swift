import UIKit

/*
 Merge two sorted linked lists and return it as a new sorted list. The new list should be made by splicing together the nodes of the first two lists.

 Example:
 Input: 1->2->4, 1->3->4
 Output: 1->1->2->3->4->4
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/// answer
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard l1 != nil else { return l2 }
    guard l2 != nil else { return l1 }
    
    var result: ListNode? = nil
    
    if(l1!.val <= l2!.val) {
        result = l1
        result?.next = mergeTwoLists(l1?.next,l2)
    } else {
        result = l2
        result?.next = mergeTwoLists(l1,l2?.next)
    }
    return result
}


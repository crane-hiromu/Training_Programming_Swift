import UIKit

/*
 Remove all elements from a linked list of integers that have value val.

 Example:
 Input:  1->2->6->3->4->5->6, val = 6
 Output: 1->2->3->4->5
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/// answer1
func removeElements1(_ head: ListNode?, _ val: Int) -> ListNode? {
    guard let h = head else { return nil }
    
    var nums = [Int]()
    if h.val != val {
        nums.append(h.val)
    }
    
    var current = head
    while let next = current?.next {
        if val != next.val {
            nums.append(next.val)
        }
        current = next
    }
    
    nums.reverse()
    var last: ListNode?
    for num in nums {
        let node = ListNode()
        node.val = num
        node.next = last
        last = node
    }
    
    return last
}

/// answer2
func removeElements2(_ head: ListNode?, _ val: Int) -> ListNode? {
    let start = ListNode()
    start.next = head
    
    var current: ListNode? = start
    
    while let next = current?.next {
        if val == next.val {
            current?.next = next.next
        } else {
            current = next
        }
    }

    return start.next
}

/// answer3 ( from discuss )
func removeElements3(_ head: ListNode?, _ val: Int) -> ListNode? {
    guard let head = head else { return nil }
    head.next = removeElements3(head.next, val)
    return head.val != val ? head : head.next
}

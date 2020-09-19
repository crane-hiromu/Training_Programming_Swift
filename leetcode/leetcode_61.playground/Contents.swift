import UIKit

/*
 Given a linked list, rotate the list to the right by k places, where k is non-negative.

 Example 1:
 Input: 1->2->3->4->5->NULL, k = 2
 Output: 4->5->1->2->3->NULL
 Explanation:
 rotate 1 steps to the right: 5->1->2->3->4->NULL
 rotate 2 steps to the right: 4->5->1->2->3->NULL
 
 Example 2:
 Input: 0->1->2->NULL, k = 4
 Output: 2->0->1->NULL
 Explanation:
 rotate 1 steps to the right: 2->0->1->NULL
 rotate 2 steps to the right: 1->2->0->NULL
 rotate 3 steps to the right: 0->1->2->NULL
 rotate 4 steps to the right: 2->0->1->NULL
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/// answer1
func rotateRight1(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard head != nil else { return nil }
    
    var vals = [Int](), current = head
    
    while let c = current {
        vals.append(c.val)
        current = c.next
    }
    
    /// 個数より多い分を考慮
    let number = (k < vals.count) ? k : k % vals.count
    
    /// rotate
    (0..<number).forEach { _ in
        vals.insert(vals.remove(at: vals.count-1), at: 0)
    }
    
    var prev: ListNode? = nil
    for val in vals.reversed() {
        let node = ListNode()
        node.val = val
        node.next = prev
        prev = node
    }
    
    return prev
}

/// answer2 ( customize discuss by self )
func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard var tail = head else { return nil }
    
    /// 個数と現在の最後尾を取り出す
    var counter = 1
    while let next = tail.next {
        counter += 1
        tail = next
    }
    
    /// kにたいして個数が超えていないかの考慮。不要な処理をguard
    var count = counter - (k % counter), newTail = head
    guard count != counter else { return head }
    
    /// 新しい最後を探し出す
    while 0 < count-1 {
        newTail = newTail?.next
        count -= 1
    }

    /// 新しい最初と最後を再定義
    let newHead = newTail?.next
    newTail?.next = nil
    tail.next = head
    return newHead
}

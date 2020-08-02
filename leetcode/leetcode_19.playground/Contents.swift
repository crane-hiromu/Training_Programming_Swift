import UIKit

/*
 Given a linked list, remove the n-th node from the end of list and return its head.

 Example:
 Given linked list: 1->2->3->4->5, and n = 2.

 After removing the second node from the end, the linked list becomes 1->2->3->5.
 Note:
 Given n will always be valid.

 Follow up:
 Could you do this in one pass?
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/// answer
func removeNthFromEnd1(_ head: ListNode?, _ n: Int) -> ListNode? {
    guard var current = head, n != 0 else { return head }
    
    /// take out all
    var values: [Int] = [current.val]
    while let nextNode = current.next {
        values.append(nextNode.val)
        current = nextNode
    }
    
    /// remove n-th node
    if n <= values.count {
        values.remove(at: values.count-n)
    }
    
    /// generate result node
    values.reverse()
    var lastNode: ListNode?
    for val in  values {
        let node = ListNode()
        node.val = val
        node.next = lastNode
        lastNode = node
    }
    
    return lastNode
}

/// answer2 ( from solution - Two pass algorithm)
func removeNthFromEnd2(_ head: ListNode?, _ n: Int) -> ListNode? {
    
    /// 個数を検出
    var length = 0
    var first = head
    while first != nil {
        length += 1
        first = first?.next
    }
    
    /// ダミーのnodeを作成し、新たにNodeを作り直す
    /// ターゲット分長さを戻し、そこまでnodeを進める
    let dummy = ListNode()
    dummy.next = head
    first = dummy
    length -= n

    while 0 < length {
        length -= 1
        first = first?.next
    }
    
    /// ターゲットの位置に着いたら１つ飛ばしてセットする
    /// （残りはセットしなくても順番通りになっている）
    first?.next = first?.next?.next
    return dummy.next
}

/// answer3 ( from solution - One pass algorithm)
func removeNthFromEnd3(_ head: ListNode?, _ n: Int) -> ListNode? {
    let dummy = ListNode()
    dummy.next = head
    
    /// 比較のために２つのnodeを用意する
    var first: ListNode? = dummy
    var second: ListNode? = dummy
    
    /// nだけ進める
    for _ in (0...n) {
        first = first?.next
    }
    
    /// firstが終わるまで進める
    /// -> firstはnだけ進んでいるので、secondは終わりからnまで進むことになる
    while first != nil {
        first = first?.next
        second = second?.next
    }
    
    /// ターゲットの位置にいるので１つ飛ばしてセットする
    second?.next = second?.next?.next
    return dummy.next
}

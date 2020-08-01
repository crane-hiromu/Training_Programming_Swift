import UIKit

/*
 Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
 k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.

 Example:
 Given this linked list: 1->2->3->4->5
 For k = 2, you should return: 2->1->4->3->5
 For k = 3, you should return: 3->2->1->4->5

 Note:
 Only constant extra memory is allowed.
 You may not alter the values in the list's nodes, only nodes itself may be changed.
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/// answer1
func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard head?.next != nil && k != 1 else { return head }

    var current = head
    var threeVals: [Int] = [head?.val ?? 0]
    var values: [Int] = []

    // すべてのNodeを取り出す
    while let next = current?.next {
        threeVals.append(next.val)
        current = next

        // 3つずつの束ができるたびに入れ替えて追加する
        guard threeVals.count % k == 0 else { continue }
        threeVals.reverse()
        values = values + threeVals
        threeVals = []
    }

    // 足されなかった余りを最後に付与
    if !threeVals.isEmpty {
        values = values + threeVals
    }

    // 逆さにして順にNodeをセットしていく
    values.reverse()
    var lastNode: ListNode?
    for (index, val) in values.enumerated() {
        guard index < values.count else { continue }

        let node = ListNode()
        node.val = val
        node.next = lastNode
        lastNode = node
    }
    return lastNode
}

import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let sum = (l1?.val ?? 0) + (l2?.val ?? 0)
    let nl = ListNode(sum)

    if 10 <= sum {
        nl.val -= 10

        if (l1?.next != nil) {
            l1?.next?.val += 1
        } else if (l2?.next != nil) {
            l2?.next?.val += 1
        }
    }

    if (l1?.next != nil || l2?.next != nil) {
        nl.next = addTwoNumbers(l1?.next, l2?.next)
    } else if (l1?.next == nil) {
        nl.next = addTwoNumbers(ListNode(1), l2?.next)
    } else if (l2?.next == nil) {
        nl.next = addTwoNumbers(l1?.next, ListNode(1))
    }
    return nl
}

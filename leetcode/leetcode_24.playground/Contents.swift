import UIKit

/*
 Given a linked list, swap every two adjacent nodes and return its head.
 You may not modify the values in the list's nodes, only nodes itself may be changed.

 Example:
 Given 1->2->3->4, you should return the list as 2->1->4->3.
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

// answer - failed ( Time Limit Exceeded )
func swapPairs1(_ head: ListNode?) -> ListNode? {
    guard head?.next != nil else { return head }
    
    var current = head
    var nodeList: [ListNode?] = [current]
    
    // take out all
    while let next = current?.next {
        nodeList.append(next)
        current = next
    }
    
    // swap
    for (i, _) in nodeList.enumerated() {
        guard i % 2 != 0 else { continue }
        
        let temp = nodeList[i-1]
        nodeList[i-1] = nodeList[i]
        nodeList[i] = temp
    }
    
    // set
    for (i, node) in nodeList.enumerated() {
        guard i < nodeList.count-1 else { continue }
        node?.next = nodeList[i+1]
    }
    
    // print(nodeList.map { $0!.val })
    return nodeList[0]
}

/// answer2
/// ListNodeを扱うとタイムアウトになるので、値だけを保持して最後にNodeに戻す
func swapPairs2(_ head: ListNode?) -> ListNode? {
    guard head?.next != nil else { return head }
    
    var current = head
    var values: [Int] = [head?.val ?? 0]
    var i = 0

    // すべてのNodeを取り出す
    while let next = current?.next {
        values.append(next.val)
        current = next
        
        if i % 2 != 0 {
            swap(list: &values, n1: i-1, n2: i)
        }
        i += 1
    }
            
    // 偶数の場合、最後のwhileが呼ばれないので手動で入れ替える
    let count = values.count
    if count % 2 == 0 {
        swap(list: &values, n1: count-1, n2: count-2)
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

func swap(list: inout [Int], n1: Int, n2: Int) {
    let temp = list[n1]
    list[n1] = list[n2]
    list[n2] = temp
}

/// answet (from discuss)
func swapPairs3(_ head: ListNode?) -> ListNode? {
    guard let h = head else { return head }
    
    var curr: ListNode? = h
    
    while curr != nil {
        if let tmp = curr?.val, let nextVal = curr?.next?.val {
            curr?.val = nextVal
            curr?.next?.val = tmp
        }
        /// 次の次をセットすることで２の倍数を回避
        curr = curr?.next?.next
    }
    
    return h
}

import UIKit

/*
 Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.

 Example:
 Input:
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 Output: 1->1->2->3->4->4->5->6
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/// answer dailed ( timeout )
/// leetcode20の２つのnodeを足していくを利用して１つづつ足していく
func mergeKLists1(_ lists: [ListNode?]) -> ListNode? {
    guard !(lists.count == 0) else { return nil }
    guard !(lists.count == 1) else { return lists[0] }
    
    var flatLists = lists
    
    while 1 < flatLists.count {
        let result = mergeTwoList(flatLists[0], flatLists[1])
        flatLists = Array(flatLists[2..<flatLists.count])
        flatLists.append(result)
    }
    
    return flatLists.first ?? nil
}

func mergeTwoList(_ l1:ListNode?, _ l2:ListNode?) -> ListNode? {
    if(l1 == nil) {return l2}
    if(l2 == nil) {return l1}
    var result:ListNode?
    
    if(l1!.val <= l2!.val) {
        result = l1
        result!.next = mergeTwoList(l1!.next,l2)
    } else {
        result = l2
        result!.next = mergeTwoList(l1,l2!.next)
    }
    return result
}


/// answer (like Brute Force)
func mergeKLists2(_ lists: [ListNode?]) -> ListNode? {
    guard !(lists.count == 0) else { return nil }
    guard !(lists.count == 1) else { return lists[0] }
    
    /// 全てのnodeを取り出す
    var flatLists = [ListNode?]()
    for node in lists {
        flatLists.append(node)

        var nextNode = node?.next
        while let next = nextNode {
            flatLists.append(next)
            nextNode = next.next
        }
    }
    
    /// sort済みの配列から、nodeのnextに順番にセットしていく
    flatLists = flatLists.compactMap { $0 }.sorted { $0.val < $1.val }
    for (i, n) in flatLists.enumerated() {
        guard i+1 < flatLists.count else { continue } // ignore out of range
        n?.next = flatLists[i+1]
    }
    
    return flatLists.first ?? nil
}

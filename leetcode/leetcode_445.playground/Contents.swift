import UIKit

/*
 You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 Follow up:
 What if you cannot modify the input lists? In other words, reversing the lists is not allowed.

 Example:
 Input: (7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 8 -> 0 -> 7
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/// answer1
func addTwoNumbers1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var prev1 = l1, prev2 = l2, nums1 = [Int](), nums2 = [Int]()
    
    /// 値の一覧を取りだす
    while prev1 != nil || prev2 != nil {
        if let val1 = prev1?.val {
           nums1.append(val1)
        }
        if let val2 = prev2?.val {
           nums2.append(val2)
        }
        prev1 = prev1?.next
        prev2 = prev2?.next
    }
    
    var prev: ListNode?, isMovedup = false
    while !nums1.isEmpty || !nums2.isEmpty || isMovedup {
        /// 値を合計
        var n1 = 0, n2 = 0, sum = 0
        if !nums1.isEmpty {
            n1 = nums1.removeLast()
        }
        if !nums2.isEmpty {
            n2 = nums2.removeLast()
        }
        sum = n1 + n2
        
        /// １つ前の桁の繰り上がり計算を考慮
        if isMovedup {
            sum += 1
            isMovedup = false
        }
        
        /// 今回の桁の繰り上がり計算を考慮
        if 9 < sum {
            sum = sum - 10
            isMovedup = true
        }
        
        /// nodeに変換
        let node = ListNode()
        node.val = sum
        node.next = prev
        prev = node
    }
    
    return prev
}

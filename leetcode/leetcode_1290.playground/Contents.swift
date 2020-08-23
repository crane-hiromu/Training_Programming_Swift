import UIKit

/*
 Given head which is a reference node to a singly-linked list. The value of each node in the linked list is either 0 or 1. The linked list holds the binary representation of a number.
 Return the decimal value of the number in the linked list.

 Example 1:
 Input: head = [1,0,1]
 Output: 5
 Explanation: (101) in base 2 = (5) in base 10
 
 Example 2:
 Input: head = [0]
 Output: 0
 
 Example 3:
 Input: head = [1]
 Output: 1
 
 Example 4:
 Input: head = [1,0,0,1,0,0,1,1,1,0,0,0,0,0,0]
 Output: 18880
 
 Example 5:
 Input: head = [0,0]
 Output: 0
  
 Constraints:
 The Linked List is not empty.
 Number of nodes will not exceed 30.
 Each node's value is either 0 or 1.
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/// answer1
func getDecimalValue1(_ head: ListNode?) -> Int {
    guard var prev = head else { return 0 }
    
    var nums: [Int] = [prev.val]
    
    while let current = prev.next {
        nums.append(current.val)
        prev = current
    }
    
    /// 取り出した値を連結し１０進数に変換
    return Int(nums.map(String.init).reduce("", +), radix: 2) ?? 0
}

/// answer2 ( from discuss )
func getDecimalValue2(_ head: ListNode?) -> Int {
    var prev = head
    var result: Int = 0
    
    // bitシフトして桁を考慮する（Intでもビットシフト可能）
    // 毎回orでビット演算し続ける。
    while let p = prev {
        result = (result << 1) | p.val
        prev = p.next
    }
    return result
}

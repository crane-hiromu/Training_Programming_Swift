import UIKit

/*
 Given the head of a linked list, return the list after sorting it in ascending order.
 
 Example 1:
 Input: head = [4,2,1,3]
 Output: [1,2,3,4]
 
 Example 2:
 Input: head = [-1,5,3,4,0]
 Output: [-1,0,3,4,5]
 
 Example 3:
 Input: head = []
 Output: []
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func sortList(_ head: ListNode?) -> ListNode? {
    guard let h = head else { return nil }
    
    /// 全てのnode（val）を取り出す
    var vals = [Int]()
    vals.append(h.val)
    
    var nextNode = h.next
    while let next = nextNode {
        vals.append(next.val)
        nextNode = next.next
    }
    
    /// sort
    var sortedVals = mergeSort(vals)
    
    /// nodeに戻す
    var result = ListNode()
    for _ in 0..<sortedVals.count {
        result.val = sortedVals.removeLast()
        var next = ListNode()
        next.next = result
        result = next
    }
    
    return result.next
}

func mergeSort(_ nums: [Int]) -> [Int] {
    guard 1 < nums.count else { return nums }
    
    let left = Array(nums[..<Int(nums.count/2)])
    let right = Array(nums[Int(nums.count/2)..<nums.count])
    return mergeSort(left: mergeSort(left), right: mergeSort(right))
}

func mergeSort(left: [Int], right: [Int]) -> [Int] {
    var l = left, r = right, results = [Int]()
    
    while 0 < l.count && 0 < r.count {
        if l[0] < r[0] {
            results.append(l.removeFirst())
        } else {
            results.append(r.removeFirst())
        }
    }
    results.append(contentsOf: l)
    results.append(contentsOf: r)
    return results
}

import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/// answer1
func detectCycle1(_ head: ListNode?) -> ListNode? {
    var hashTable = [Int: Int](), current = head
    
    while let c = current {
        if let val = hashTable[c.val] {
            // 同じnodeの当たった時 || nodeが連続する場合
            if val == c.next?.val || c.val == c.next?.val {
                return c
            }
        } else if let next = c.next {
            hashTable[c.val] = next.val
        } else {
            return nil
        }
        
        current = c.next
    }
    
    return nil
}

import UIKit

/*
 Given a Binary Search Tree and a target number, return true if there exist two elements in the BST such that their sum is equal to the given target.

 Example 1:

 Input:
     5
    / \
   3   6
  / \   \
 2   4   7

 Target = 9
 Output: True
  
 Example 2:

 Input:
     5
    / \
   3   6
  / \   \
 2   4   7

 Target = 28
 Output: False
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

/// answer1 ( from solution - hash)
func findTarget1(_ root: TreeNode?, _ k: Int) -> Bool {
    var hash = Set<Int>()
    return find1(root, k, &hash)
}

func find1(_ root: TreeNode?, _ k: Int, _ vals: inout Set<Int>) -> Bool {
    guard let r = root else { return false }
    
    /// 差分が含まれていた段階でtrueが確定する
    if vals.contains(k-r.val) {
        return true
    } else {
        vals.insert(r.val)
        return find1(r.left, k, &vals) || find1(r.right, k, &vals)
    }
}


/// answer2 ( brute force )
func findTarget2(_ root: TreeNode?, _ k: Int) -> Bool {
    var hash = [Int]()
    takeOutVals2(root, &hash)
    
    for n in 0..<hash.count {
        for m in 0..<hash.count {
            if n != m, hash[n]+hash[m] == k {
                return true
            }
        }
    }
    return false
}

func takeOutVals2(_ root: TreeNode?, _ vals: inout [Int]) {
    guard let r = root else { return }
    
    vals.append(r.val)
    takeOutVals2(r.left, &vals)
    takeOutVals2(r.right, &vals)
}

/// answer ( two pointer )
func findTarget3(_ root: TreeNode?, _ k: Int) -> Bool {
    var hash = [Int]()
    takeOutVals3(root, &hash)
    
    hash = hash.sorted()
    
    var left = 0, right = hash.count-1
    
    while left < right {
        let sum = hash[left] + hash[right]
        
        if sum == k {
            return true
        } else if sum < k {
            left += 1
        } else {
            right -= 1
        }
    }
    return false
}

func takeOutVals3(_ root: TreeNode?, _ vals: inout [Int]) {
    guard let r = root else { return }
    
    vals.append(r.val)
    takeOutVals3(r.left, &vals)
    takeOutVals3(r.right, &vals)
}

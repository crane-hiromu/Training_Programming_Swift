import UIKit

/*
 Write a function that takes an unsigned integer and return the number of '1' bits it has (also known as the Hamming weight).

 Example 1:
 Input: 00000000000000000000000000001011
 Output: 3
 Explanation: The input binary string 00000000000000000000000000001011 has a total of three '1' bits.
 
 Example 2:
 Input: 00000000000000000000000010000000
 Output: 1
 Explanation: The input binary string 00000000000000000000000010000000 has a total of one '1' bit.
 
 Example 3:
 Input: 11111111111111111111111111111101
 Output: 31
 Explanation: The input binary string 11111111111111111111111111111101 has a total of thirty one '1' bits.
  
 Note:
 Note that in some languages such as Java, there is no unsigned integer type. In this case, the input will be given as signed integer type and should not affect your implementation, as the internal binary representation of the integer is the same whether it is signed or unsigned.
 In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 3 above the input represents the signed integer -3.
  
 Follow up:
 If this function is called many times, how would you optimize it?
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

// 右からみて、見える数字を列挙する/
//
// ex
//       1
//   2      null
// 3   4  null null
//
// -> [1,2,4]

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var nums = [Int]()
        dfs(index: 0, next: root, nums: &nums)
        return nums
    }
    
    func dfs(index: Int, next node: TreeNode?, nums: inout [Int]) {
        guard let node = node else { return }
        
        // 右から調査しているので、一番先端にあるものを追加していくだけで良い
        if index == nums.count {
            nums.append(node.val)
        }

        dfs(index: index+1, next: node.right, nums: &nums)
        dfs(index: index+1, next: node.left, nums: &nums)
    }
}

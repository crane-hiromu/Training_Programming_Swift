import UIKit

/*
 Given the root of a binary tree and an integer targetSum, return the number of paths where the sum of the values along the path equals targetSum.
 The path does not need to start or end at the root or a leaf, but it must go downwards (i.e., traveling only from parent nodes to child nodes).

 Example 1:
 Input: root = [10,5,-3,3,2,null,11,3,-2,null,1], targetSum = 8
 Output: 3
 Explanation: The paths that sum to 8 are shown.
 
 Example 2:
 Input: root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
 Output: 3

 Constraints:
 The number of nodes in the tree is in the range [0, 1000].
 -109 <= Node.val <= 109
 -1000 <= targetSum <= 1000
 Accepted
 325,638
 Submissions
 655,278
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

// bad result
// 重複の計算が、`targetSum`と`node`の値が同じ && 同じ数字が連続した場合 に対応できないので後半のテストケースを回避できず
// input: [0,1,1], targetSum: 1
func _pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
    var result = [[Int]]()
    _pathSum(root, targetSum, [], &result)
    return Set(result).count
}

func _pathSum(_ root: TreeNode?, _ targetSum: Int, _ stack: [Int], _ result: inout [[Int]]) {
    guard let r = root else { return }
    
    let nums = stack + [r.val]
    
    // 重複を防ぐために`leaf`に辿り着いてから計算する
    if r.left == nil, r.right == nil {
        // 道順の中から`targetSum`の組み合わせとなるものを探す
        for i in 0...nums.count { // 取り出す個数を徐々に増やす
            for j in 0..<nums.count where j+i <= nums.count { // 連続していることを利用してスライドさせていく
                let rangeNums = nums[j..<j+i]
                if !rangeNums.isEmpty, rangeNums.reduce(0, +) == targetSum {
                    result.append(Array(rangeNums))
                }
            }
        }
    }
    _pathSum(r.left, targetSum, nums, &result)
    _pathSum(r.right, targetSum, nums, &result)
}

// DFS
func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
    guard let r = root else { return 0 }
    return findPath(r, sum) + pathSum(r.left, sum) + pathSum(r.right, sum)
}

func findPath(_ root: TreeNode?, _ sum: Int) -> Int {
    guard let r = root else { return 0 }
    
    var result = 0
    
    if sum == r.val { result += 1 }
    result += findPath(r.left, sum - r.val)
    result += findPath(r.right, sum - r.val)
    return result
}

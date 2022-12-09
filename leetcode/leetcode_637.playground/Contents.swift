import UIKit

/*
 Given the root of a binary tree, return the average value of the nodes on each level in the form of an array. Answers within 10-5 of the actual answer will be accepted.
  
 Example 1:
 Input: root = [3,9,20,null,null,15,7]
 Output: [3.00000,14.50000,11.00000]
 Explanation: The average value of nodes on level 0 is 3, on level 1 is 14.5, and on level 2 is 11.
 Hence return [3, 14.5, 11].
 
 Example 2:
 Input: root = [3,9,20,15,7]
 Output: [3.00000,14.50000,11.00000]
  
 Constraints:
 The number of nodes in the tree is in the range [1, 104].
 -231 <= Node.val <= 231 - 1
 */

// DFS(preorder) + hashmap
class Solution {
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        var dict = [Double: (count: Double, sum: Double)]()
        preorder(next: root, level: 0, dict: &dict)
        return dict.sorted { $0.key < $1.key }.map { $0.value.sum/$0.value.count }
    }

    func preorder(next node: TreeNode?, level: Double, dict: inout [Double: (count: Double, sum: Double)]) {
        guard let n = node else { return }

        let values = dict[level] ?? (count: 0, sum: 0)
        dict[level] = (count: values.count+1, sum: values.sum+Double(n.val))

        preorder(next: n.left, level: level+1, dict: &dict)
        preorder(next: n.right, level: level+1, dict: &dict)
    }
}

// BFS
func averageOfLevels(_ root: TreeNode?) -> [Double] {
    guard let r = root else { return [] }

    var queues = [r]
    var result = [Double]()

    while !queues.isEmpty {
        var count = queues.count
        var sum = 0

        for _ in queues {
            let queue = queues.removeFirst()

            if let l = queue.left {
                queues.append(l)
            }
            if let r = queue.right {
                queues.append(r)
            }
            sum += queue.val
        }
        result.append(Double(sum)/Double(count))
    }
    return result
}

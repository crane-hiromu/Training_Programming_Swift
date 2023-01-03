import UIKit

/*
 Given a binary tree with the following rules:

 root.val == 0
 If treeNode.val == x and treeNode.left != null, then treeNode.left.val == 2 * x + 1
 If treeNode.val == x and treeNode.right != null, then treeNode.right.val == 2 * x + 2
 Now the binary tree is contaminated, which means all treeNode.val have been changed to -1.

 Implement the FindElements class:

 FindElements(TreeNode* root) Initializes the object with a contaminated binary tree and recovers it.
 bool find(int target) Returns true if the target value exists in the recovered binary tree.

 Example 1:
 Input
 ["FindElements","find","find"]
 [[[-1,null,-1]],[1],[2]]
 Output
 [null,false,true]
 Explanation
 FindElements findElements = new FindElements([-1,null,-1]);
 findElements.find(1); // return False
 findElements.find(2); // return True
 
 Example 2:
 Input
 ["FindElements","find","find","find"]
 [[[-1,-1,-1,-1,-1]],[1],[3],[5]]
 Output
 [null,true,true,false]
 Explanation
 FindElements findElements = new FindElements([-1,-1,-1,-1,-1]);
 findElements.find(1); // return True
 findElements.find(3); // return True
 findElements.find(5); // return False
 
 Example 3:
 Input
 ["FindElements","find","find","find","find"]
 [[[-1,null,-1,-1,null,-1]],[2],[3],[4],[5]]
 Output
 [null,true,false,false,true]
 Explanation
 FindElements findElements = new FindElements([-1,null,-1,-1,null,-1]);
 findElements.find(2); // return True
 findElements.find(3); // return False
 findElements.find(4); // return False
 findElements.find(5); // return True
  
 Constraints:
 TreeNode.val == -1
 The height of the binary tree is less than or equal to 20
 The total number of nodes is between [1, 104]
 Total calls of find() is between [1, 104]
 0 <= target <= 106
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

// BFS - Time Limit Exceeded
class FindElements {
    private var nums: [Int: Bool] = [0: true]
    private var number = 0
    private var queues = [TreeNode]()
    private var count = 0

    init(_ root: TreeNode?) {
        guard let r = root else { return }
        queues = [r]
        
        while !queues.isEmpty {
            var _queues = queues

            for _ in _queues {
                let queue = queues.removeFirst()
                add(queue.left)
                add(queue.right)
            }

            if count == queues.count { break }
            count = 0
        }
    }
    
    func find(_ target: Int) -> Bool {
        nums[target] ?? false
    }

    func add(_ node: TreeNode?) {
        number += 1
        
        if let n = node {
            queues.append(n)
            nums[number] = true
        } else {
            queues.append(TreeNode())
            count += 1
        }
    }
}

// DFS
class FindElements {

    private var set: Set<Int> = []
    
    init(_ root: TreeNode?) {
        set.insert(0)
        dfs(root, 0)
    }
    
    func find(_ target: Int) -> Bool {
        set.contains(target)
    }

    func dfs(_ node: TreeNode?, _ x: Int) {
        if node == nil { return }

        if let l = node?.left {
            let val =  2 * x + 1
            node?.left?.val = val
            set.insert(val)
            dfs(l, val)
        }
        if let r = node?.right {
            let val =  2 * x + 2
            node?.right?.val = val
            set.insert(val)
            dfs(r, val)
        }
    }
}

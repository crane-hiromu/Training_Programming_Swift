import UIKit

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

// BFS
func smallestFromLeaf(_ root: TreeNode?) -> String {
    guard let r = root else { return "" }

    let alpahabet = (97...122).map({String(Character(UnicodeScalar($0)))})
    var queue = [(node: r, str: "")], result = "|"

    while !queue.isEmpty {
        for _ in queue {
            let obj = queue.removeFirst()
            let str = alpahabet[obj.node.val] + obj.str

            // if current node is leaf, check string
            if obj.node.left == nil, obj.node.right == nil, str < result {
                result = str
            }

            if let left = obj.node.left { queue.append((node: left, str: str)) }
            if let right = obj.node.right { queue.append((node: right, str: str)) }
        }
    }

    return result
}

// DFS
var result = "|"
let alpahabet = (97...122).map({String(Character(UnicodeScalar($0)))})

func smallestFromLeaf2(_ root: TreeNode?) -> String {
    let curr = ""
    getSmallest2(root, curr)
    return result
}

func getSmallest2(_ root: TreeNode?, _ curr: String) {
    guard let r = root else { return }
    let next = alpahabet[r.val] + curr
    
    if r.left == nil, r.right == nil, next < result {
        result = next
    }
    getSmallest2(r.left, next)
    getSmallest2(r.right, next)
}

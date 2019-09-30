
import Foundation

/* practice leetcode */

// https://leetcode.com/problems/valid-parentheses/
// Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
// Note that an empty string is also considered valid.

// Example 1: Input: "()", Output: true
// Example 2: Input: "()[]{}", Output: true
// Example 3: Input: "(]", Output: false
// Example 4: Input: "([)]", Output: false
// Example 5: Input: "{[]}", Output: true

// Answer 1

func isValid(s: String) -> Bool {
    guard !s.isEmpty else { return false }
    
    let stringList: [String] = s.map { "\($0)" }
    guard stringList.count % 2 == 0 else { return false } // ignore odd number
    
    let stringLastCountIndex = stringList.count - 1
    let stringHalfList = stringList[0..<Int(stringList.count/2)]
    
    let result = stringHalfList.enumerated().first { offset, element in
        let otherSide = stringList[stringLastCountIndex-offset]
   
        switch element {
        case "(":  return otherSide != ")"
        case "{":  return otherSide != "}"
        case "[":  return otherSide != "]"
        default: return true
        }
    }?.element
    
    return result == nil
}

//isValid(s: "()") // true
//isValid(s: "()[]{}") // fasle // valid
//isValid(s: "(]") // false
//isValid(s: "([)]") // false
//isValid(s: "{[]}") // true

// 半分に分割して計算量を減らそうとしたが、２問目が解決できないことに気づいた。


// Answer 2

func canCloseCharacters(_ s: String) -> Bool {
    var sArray: [Character] = []

    for t in s {
        if t == "(" || t == "{" || t == "[" {
            sArray.append(t)
        } else if t == ")" {
            if sArray.isEmpty || sArray.removeLast() != "(" {
                return false
            }
        } else if t == "}" {
            if sArray.isEmpty || sArray.removeLast() != "{" {
                return false
            }
        } else if t == "]" {
            if sArray.isEmpty || sArray.removeLast() != "[" {
                return false
            }
        }
    }

    return sArray.isEmpty
}

canCloseCharacters("()") // true
canCloseCharacters("()[]{}") // true
canCloseCharacters("(]") // false
canCloseCharacters("([)]") // false
canCloseCharacters("{[]}") // true
canCloseCharacters("") // true
canCloseCharacters("]]") // true


// https://leetcode.com/problems/kth-largest-element-in-a-stream
// Design a class to find the kth largest element in a stream. Note that it is the kth largest element in the sorted order, not the kth distinct element.
// Your KthLargest class will have a constructor which accepts an integer k and an integer array nums, which contains initial elements from the stream. For each call to the method KthLargest.add, return the element representing the kth largest element in the stream.

// Example:
//
//    int k = 3;
//    int[] arr = [4,5,8,2];
//    KthLargest kthLargest = new KthLargest(3, arr);
//    kthLargest.add(3);   // returns 4
//    kthLargest.add(5);   // returns 5
//    kthLargest.add(10);  // returns 5
//    kthLargest.add(9);   // returns 8
//    kthLargest.add(4);   // returns 8
//
// Note: You may assume that nums' length ≥ k-1 and k ≥ 1.

final class KthLargest {
    
    private let k: Int
    private var nums: [Int]

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.nums = nums.sorted { $1 < $0 }
    }
    
    func add(_ val: Int) -> Int {
        self.nums.append(val)
        
        for i in 0...nums.count-1 {
            if nums[i] < val {
                nums.removeLast()
                nums.insert(val, at: i)
                break
            }
        }
        return self.nums[self.k-1]
    }
}

let arr: [Int] = [4,5,8,2]
let kth = KthLargest(3, arr)
kth.add(3)
kth.add(5)
kth.add(10)
kth.add(9)
kth.add(4)


// https://leetcode.com/problems/top-k-frequent-elements/
// Given a non-empty array of integers, return the k most frequent elements.

// Example 1: Input: nums = [1,1,1,2,2,3], k = 2 / Output: [1,2]
// Example 2: Input: nums = [1], k = 1 / Output: [1]
// Note:
// You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
// Your algorithm's time complexity must be better than O(n log n), where n is the array's size.

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var combinations = [Int: Int]()

    for n in nums {
        if let val = combinations[n] {
            combinations[n] = val + 1
        } else {
            combinations[n] = 1
        }
    }
    
    let highToLow = combinations.sorted(by: { $1.value < $0.value })
    var result = [Int]()
    
    for m in 0..<k {
        result.append(highToLow[m].key)
    }
    return result
}

topKFrequent([1,1,1,2,2,3], 2)
topKFrequent([1], 1)



// https://leetcode.com/problems/find-k-pairs-with-smallest-sums/

func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
    var combinations: [[Int]] = []
    
    for n in nums1 {
        for m in nums2 {
            combinations.append([n, m, n+m])
        }
    }
    
    let result: [[Int]] = combinations.sorted(by: {
        $0[2] < $1[2]
    })
    
    var end = k
    if combinations.count < k {
        end = combinations.count
    }
    
    var answer: [[Int]] = []
    
    for l in 0..<end {
        answer.append([result[l][0], result[l][1]])
    }
    return answer
}

kSmallestPairs([1,7,11], [2,4,6], 3)


// https://leetcode.com/problems/two-sum/

// first answer
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for n in 0..<nums.count {
        for m in n+1..<nums.count {
            if nums[n] + nums[m] == target {
                return [n, m]
            }
        }
    }
    return []
}

// second answer
func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    var keyValue = [Int: Int]()
    
    for (i, num) in nums.enumerated() {
        if let index = keyValue[target-num] {
            return [i, index]
        }
        keyValue[num] = i
    }
    return []
}



// https://leetcode.com/problems/intersection-of-two-arrays

// answer1 one liner
func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    return Array(Set(nums1.filter(nums2.contains)))
}

// answer2 litlte memory
func intersection2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var result = [Int]()
    
    for n1 in nums1 {
        if nums2.contains(n1), !result.contains(n1) {
            result.append(n1)
        }
    }
    
    return result
}

// other answer
func intersection3(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    return Set(nums1).filter(Set(nums2).contains)
}

func intersection4(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    return Array(Set(nums1).intersection(Set(nums2)))
}


// https://leetcode.com/problems/unique-email-addresses/




// https://leetcode.com/problems/unique-email-addresses/submissions/

// components(separatedBy:)はStringを返す分、split(separator:)より遅い

func numUniqueEmails(_ emails: [String]) -> Int {
    var remakeEmails = [String]()
    
    for email in emails {
        var parts = email.split(separator: "@")
        parts[0] = parts[0].split(separator: "+")[0]
        parts[0] = parts[0].split(separator: ".").reduce("") { $0+$1 }
        
        let new: String = parts[0] + "@" + parts[1]
        
        if !remakeEmails.contains(new) {
            remakeEmails.append((new))
        }
    }
    return remakeEmails.count
}


// https://leetcode.com/problems/first-unique-character-in-a-string

// 1 タイムアウトになってしまった
func firstUniqChar(_ s: String) -> Int {
    let arrayStrs = s.map { "\($0)" }
    
    for (index, str) in arrayStrs.enumerated() {
        let count = s.components(separatedBy: str).count
        
        if count == 2 {
            return index
        }
    }
    return -1
}

// 2
func firstUniqChar2(_ s: String) -> Int {
    var dict = [Character: Int]()
    
    for str in s {
        if dict[str] == nil {
            dict[str] = 1
        } else {
            dict[str]! += 1
        }
    }
    
    for (index, dic) in s.enumerated() {
        if dict[dic] == 1 {
            return index
        }
    }
    return -1
}


// https://leetcode.com/problems/maximum-depth-of-binary-tree

class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
             self.left = nil
             self.right = nil
     }
 }

func maxDepth(_ root: TreeNode?) -> Int {
    /// 階層があるか確認
    /// ある場合は左と右の階層をそれぞれ確認し、再帰関数で子供も探索していく
    /// max関数で値が大きい方がかう深い階層になる
    guard let r = root else { return 0 }
    return max(maxDepth(r.left), maxDepth(r.right)) + 1 // 階層を追うごとに1増やしていく
}

/// わかりやすい例
func maxDepthEx(_ root: TreeNode?) -> Int {
    
    var sumLeft = 0
    var sumRight = 0
    
    if let root = root {
        
        sumLeft = 1
        sumRight = 1
        
        if let left = root.left {
            sumLeft = 1 + maxDepth(left)
        }
        if let right = root.right {
            sumRight = 1 + maxDepth(right)
        }
    }
    
    return max(sumLeft, sumRight)
}


/// https://leetcode.com/problems/minimum-depth-of-binary-tree

func minDepth(_ root: TreeNode?) -> Int {
    guard let r = root else { return 0 }
    
    let left = minDepth(r.left)
    let right = minDepth(r.right)
    let minIndex = min(left, right)
    
    if minIndex == 0 {
        return max(left, right) + 1
    } else {
        return minIndex + 1
    }
}

// ちょっとだけ速い回答
func minDepth2(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    let left = minDepth(root.left)
    let right = minDepth(root.right)
    
    if left == 0 {
        return right + 1
    } else if right == 0 {
        return left + 1
    } else {
        return min(left, right) + 1
    }
}


// https://leetcode.com/problems/merge-two-binary-trees

func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    if t1 == nil, t2 == nil { return nil }
    
    let node = TreeNode((t1?.val ?? 0) + (t2?.val ?? 0))
    node.left = mergeTrees(t1?.left, t2?.left)
    node.right = mergeTrees(t1?.right, t2?.right)
    return node
}


// https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    guard !nums.isEmpty else { return nil }
    
    let center: Int = nums.count/2
    let node = TreeNode(nums[center])
    node.left = sortedArrayToBST(Array(nums[0..<center]))
    node.right = sortedArrayToBST(Array(nums[center+1..<nums.count]))
    return node
}


// https://leetcode.com/problems/path-sum

func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
    guard let r = root else { return false }
    
    let diff: Int = sum - r.val
    
    guard r.left != nil || r.right != nil else { return diff == 0 }
    
    // guard ではなく if でm以下のように可能だが、&&で両方評価する分え、上の方が速いっぽい？
//    if r.left == nil && r.right == nil {
//        return diff == 0
//    }
    
    return (hasPathSum(r.left, diff) || hasPathSum(r.right, diff))
}


/// https://leetcode.com/problems/validate-binary-search-tree

/// 子ノードを取り出すテンプレートコード

func node(_ root: TreeNode?) -> [TreeNode] {
    guard let r = root else { return [] }
    
    var nodes = [TreeNode]()
    if let left = r.left {
        nodes.append(left)
        for node in node(left) {
            nodes.append(node)
        }
    }
    if let right = r.right {
        nodes.append(right)
        for node in node(right) {
            nodes.append(node)
        }
    }
    return nodes
}

// これではダメらしい
// [3,null,30,10,null,null,15,null,45]
func isValidBST(_ root: TreeNode?) -> Bool {
    guard let r = root else { return true }
    
    /// validation
    if r.left == nil, r.right == nil {
        return true
    }
    
    /// left
    if let left = r.left {
        guard left.val < r.val else { return false }
        
        for lNode in node(left) {
            if r.val <= lNode.val {
                return false
            }
        }
    }
    
    /// right
    if let right = r.right {
        guard r.val < right.val else { return false }
        
        for rNode in node(right) {
            if rNode.val <= r.val, rNode.val <= right.val {
                return false
            }
        }
    }
    
    return true
}

// 正しいもの
func isValidBST_r(_ root: TreeNode?) -> Bool {
    return isBST(root, min: nil, max: nil)
}

func isBST(_ node: TreeNode?, min: Int?, max: Int?) -> Bool {
    guard let node = node else {return true}
    
    if let min = min {
        if node.val <= min {
            return false
        }
    }
    
    if let max = max {
        if node.val >= max {
            return false
        }
    }
    
    return isBST(node.left, min: min, max: node.val) && isBST(node.right, min: node.val, max: max)
}


// https://leetcode.com/problems/maximum-subarray

func maxSubArray(_ nums: [Int]) -> Int {
    if nums.isEmpty { return 0 }
    if nums.count == 1 { return nums[0] }
    
    var sum = nums[0]
    var result = nums[0]
    
    for i in 1..<nums.count {
        sum += nums[i]
        
        // 大きい場合は初期値をリセット
        if sum < nums[i] {
            sum = nums[i]
        }
        if result < sum {
            result = sum
        }
    }
    return result
}


// https://leetcode.com/problems/house-robber

// 偶奇で合計のでかいのをかえす。これだと隣り合うものしか判定できない。
func rob(_ nums: [Int]) -> Int {
    var evenNums = [Int]()
    var oddNums = [Int]()
    
    for (index, num) in nums.enumerated() {
        if index % 2 == 0 {
            evenNums.append(num)
        } else {
            oddNums.append(num)
        }
    }
    
    return max(evenNums.reduce(0){ $0 + $1 },
               oddNums.reduce(0){ $0 + $1 })
}


// https://leetcode.com/problems/search-insert-position

// 正解だがバイナリーサーチにならないので違うのを考える。(index(of:)はswiftで用意されているものなので）
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    if let index = nums.index(of: target) {
        return index
    }
    
    var endIndex = 0
    for (index, num) in nums.enumerated() {
        if target < num {
            return index
        }
        endIndex = index
    }
    return endIndex + 1
}


// https://leetcode.com/problems/powx-n

// タイムアウトになる
func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 { return 1 }
    
    var currentX = x
    
    if 0 < n {
        for _ in 1..<n {
            currentX *= x
        }
        return currentX
        
    } else {
        for _ in 1..<Swift.abs(n) {
            currentX *= x
        }
        return 1/currentX
    }
}

// swiftの関数を用いたもの。再帰関数になっていないので本来の意図としては正しくない可能性が高い。下の１行で問題ない。
func myPow2(_ x: Double, _ n: Int) -> Double {
    if n == 0 { return 1 }
    
    if 0 < n {
        return pow(x, Double(n))
        
    } else {
        return pow(1/x, Swift.abs(Double(n)))
    }
}

func myPow3(_ x: Double, _ n: Int) -> Double {
    return pow(x, Double(n))
}


// https://leetcode.com/problems/move-zeroes


/// 自分の回答
func moveZeroes(_ nums: inout [Int]) {
    var zeroIndexes = [Int]()
    
    for (index, num) in nums.enumerated() {
        if num == 0 {
            zeroIndexes.append(index)
        }
    }
    
    var counter = 0
    for index in zeroIndexes {
        nums.remove(at: index - counter)
        counter += 1
        nums.append(0)
    }
}

/// swiftらしい回答
func moveZeroes2(_ nums: inout [Int]) {
    let count = nums.count
    nums = nums.filter { $0 != 0 }
    
    for _ in nums.count..<count {
        nums.append(0)
    }
}


// https://leetcode.com/problems/remove-duplicates-from-sorted-list

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    guard let h = head else { return nil }
    
    var curt = h
    
    // 次がなくなるまで実行
    while curt.next != nil {
        // 現在の値と次が同じ場合。次をスキップする
        if let next = curt.next {
            if next.val == curt.val {
                curt.next = next.next
            } else {
                curt = next
            }
        }
    }
    
    return head
}

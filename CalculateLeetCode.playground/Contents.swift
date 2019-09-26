
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

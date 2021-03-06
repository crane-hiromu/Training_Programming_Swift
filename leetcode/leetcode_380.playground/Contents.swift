import UIKit

/*
 Design a data structure that supports all following operations in average O(1) time.

 insert(val): Inserts an item val to the set if not already present.
 remove(val): Removes an item val from the set if present.
 getRandom: Returns a random element from the current set of elements (it's guaranteed that at least one element exists when this method is called). Each element must have the same probability of being returned.
  
 Example 1:
 Input
 ["RandomizedSet", "insert", "remove", "insert", "getRandom", "remove", "insert", "getRandom"]
 [[], [1], [2], [2], [], [1], [2], []]
 Output
 [null, true, false, true, 2, true, false, 2]

 Explanation
 RandomizedSet randomizedSet = new RandomizedSet();
 randomizedSet.insert(1); // Inserts 1 to the set. Returns true as 1 was inserted successfully.
 randomizedSet.remove(2); // Returns false as 2 does not exist in the set.
 randomizedSet.insert(2); // Inserts 2 to the set, returns true. Set now contains [1,2].
 randomizedSet.getRandom(); // getRandom should return either 1 or 2 randomly.
 randomizedSet.remove(1); // Removes 1 from the set, returns true. Set now contains [2].
 randomizedSet.insert(2); // 2 was already in the set, so return false.
 randomizedSet.getRandom(); // Since 2 is the only number in the set, getRandom always return 2.
  
 Constraints:

 -231 <= val <= 231 - 1
 At most 105 calls will be made to insert, remove, and getRandom.
 There will be at least one element in the data structure when getRandom is called.
 */

/// dailed answer1 ( time out )
class RandomizedSet1 {
    
    var dict: [Int: Bool]

    init() {
        self.dict = [Int: Bool]()
    }
    
    func insert(_ val: Int) -> Bool {
        if let flag = dict[val], flag {
            return false
        } else {
            dict[val] = true
            return true
        }
    }
    
    func remove(_ val: Int) -> Bool {
        if let flag = dict[val], flag {
            dict[val] = false
            return true
        } else {
            return false
        }
    }
    
    func getRandom() -> Int {
        return dict.filter{ $0.value }.keys.randomElement()!
    }
}

/// answer2
class RandomizedSet2 {
    
    var vals: Set<Int>

    init() {
        self.vals = Set<Int>()
    }
    
    func insert(_ val: Int) -> Bool {
        let hasVal = vals.contains(val)
        vals.insert(val)
        return !hasVal
    }
    
    func remove(_ val: Int) -> Bool {
        let hasVal = vals.contains(val)
        vals.remove(val)
        return hasVal
    }
    
    func getRandom() -> Int {
        return vals.randomElement()!
    }
}

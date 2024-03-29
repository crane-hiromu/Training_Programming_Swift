import UIKit

/*
 Given an array arr, replace every element in that array with the greatest element among the elements to its right, and replace the last element with -1.
 After doing so, return the array.

 Example 1:
 Input: arr = [17,18,5,4,6,1]
 Output: [18,6,6,6,1,-1]
 Explanation:
 - index 0 --> the greatest element to the right of index 0 is index 1 (18).
 - index 1 --> the greatest element to the right of index 1 is index 4 (6).
 - index 2 --> the greatest element to the right of index 2 is index 4 (6).
 - index 3 --> the greatest element to the right of index 3 is index 4 (6).
 - index 4 --> the greatest element to the right of index 4 is index 5 (1).
 - index 5 --> there are no elements to the right of index 5, so we put -1.
 
 Example 2:
 Input: arr = [400]
 Output: [-1]
 Explanation: There are no elements to the right of index 0.
  
 Constraints:
 1 <= arr.length <= 104
 1 <= arr[i] <= 105
 */

// timeout 1
func replaceElements1(_ arr: [Int]) -> [Int] {
    var newArr = arr, result = [Int]()
    
    while !newArr.isEmpty {
        newArr.removeFirst()
        result.append(newArr.max() ?? -1)
    }
    
    return result
}

// timeout 2
func replaceElements2(_ arr: [Int]) -> [Int] {
    var newArr = arr, result = [Int]()
    
    for index in (0..<newArr.count) {
        newArr[index] = -1
        result.append(newArr.max()!)
    }
    
    return result
}

// OK
func replaceElements3(_ arr: [Int]) -> [Int] {
    var result = [-1]
    for i in (1..<arr.count).reversed() {
        result.insert(max(result[0], arr[i]), at: 0)
    }
    return result
}

class Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        var new = [Int]()

        for i in 0..<arr.count where i+1 < arr.count {
            var maximum = -1

            for num in arr[i+1...arr.count-1] where maximum < num {
                maximum = num
            }
            new.append(maximum)
        }
        new.append(-1)
        return new
    }
}

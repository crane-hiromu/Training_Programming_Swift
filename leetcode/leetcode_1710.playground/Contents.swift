/*
 You are assigned to put some amount of boxes onto one truck. You are given a 2D array boxTypes, where boxTypes[i] = [numberOfBoxesi, numberOfUnitsPerBoxi]:

 numberOfBoxesi is the number of boxes of type i.
 numberOfUnitsPerBoxi is the number of units in each box of the type i.
 You are also given an integer truckSize, which is the maximum number of boxes that can be put on the truck. You can choose any boxes to put on the truck as long as the number of boxes does not exceed truckSize.

 Return the maximum total number of units that can be put on the truck.

 Example 1:
 Input: boxTypes = [[1,3],[2,2],[3,1]], truckSize = 4
 Output: 8
 Explanation: There are:
 - 1 box of the first type that contains 3 units.
 - 2 boxes of the second type that contain 2 units each.
 - 3 boxes of the third type that contain 1 unit each.
 You can take all the boxes of the first and second types, and one box of the third type.
 The total number of units will be = (1 * 3) + (2 * 2) + (1 * 1) = 8.
 
 Example 2:
 Input: boxTypes = [[5,10],[2,5],[4,7],[3,9]], truckSize = 10
 Output: 91
  
 Constraints:
 1 <= boxTypes.length <= 1000
 1 <= numberOfBoxesi, numberOfUnitsPerBoxi <= 1000
 1 <= truckSize <= 106
 */

class Solution {
    func maximumUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
        var sortedBoxTypes = bubbleSort(boxTypes)
        var result = 0

        for _ in (0..<truckSize) {
            sortedBoxTypes[0][0] -= 1
            result += sortedBoxTypes[0][1]

            if sortedBoxTypes[0][0] == 0 {
                sortedBoxTypes.removeFirst()
            }
            if sortedBoxTypes.isEmpty {
                return result
            }
        }

        return result
    }

    func quickSort(_ boxTypes: [[Int]]) -> [[Int]] {
        guard 1 < boxTypes.count else { return boxTypes }

        let pivot = boxTypes[boxTypes.count/2][1]
        let less = boxTypes.filter { $0[1] < pivot }
        let equal = boxTypes.filter { $0[1] == pivot }
        let greater = boxTypes.filter { pivot < $0[1] }

        return quickSort(greater) + equal + quickSort(less)
    }

    func bubbleSort(_ boxTypes: [[Int]]) -> [[Int]] {
        var new = boxTypes
        var isSwapped = true

        while isSwapped {
            isSwapped = false

            for i in 0..<new.count-1 where new[i][1] < new[i+1][1] {
                new.swapAt(i, i+1)
                isSwapped = true
            }
        }
        return new
    }
}

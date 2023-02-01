import UIKit

/*
 It is a sweltering summer day, and a boy wants to buy some ice cream bars.
 At the store, there are n ice cream bars. You are given an array costs of length n, where costs[i] is the price of the ith ice cream bar in coins. The boy initially has coins coins to spend, and he wants to buy as many ice cream bars as possible.

 Note: The boy can buy the ice cream bars in any order.
 Return the maximum number of ice cream bars the boy can buy with coins coins.
 You must solve the problem by counting sort.

 Example 1:
 Input: costs = [1,3,2,4,1], coins = 7
 Output: 4
 Explanation: The boy can buy ice cream bars at indices 0,1,2,4 for a total price of 1 + 3 + 2 + 1 = 7.

 Example 2:
 Input: costs = [10,6,8,7,7,8], coins = 5
 Output: 0
 Explanation: The boy cannot afford any of the ice cream bars.
 
 Example 3:
 Input: costs = [1,6,3,1,2,5], coins = 20
 Output: 6
 Explanation: The boy can buy all the ice cream bars for a total price of 1 + 6 + 3 + 1 + 2 + 5 = 18.
  
 Constraints:
 costs.length == n
 1 <= n <= 105
 1 <= costs[i] <= 105
 1 <= coins <= 108
 */

class Solution {
    func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
        let sortedCosts = quickSort(costs)
        var counter = 0, sum = coins
        
        for cost in sortedCosts {
            sum -= cost
            if sum < 0 { return counter }
            counter += 1
        }
        return counter
    }

    func quickSort(_ nums: [Int]) -> [Int] {
        guard 1 < nums.count else { return nums }

        let pivot = nums[nums.count/2]
        let less = nums.filter { $0 < pivot }
        let equal = nums.filter { $0 == pivot }
        let greater = nums.filter { pivot < $0 }

        return quickSort(less) + equal + quickSort(greater)
    }

    // time out
    func bubbleSort(_ nums: [Int]) -> [Int] {
        var result = nums
        var isSwapped = true

        while isSwapped {
            isSwapped = false

            for i in 0..<result.count-1 where result[i] > result[i+1] {
                result.swapAt(i, i+1)
                isSwapped = true
            }
        }
        return result
    }
}

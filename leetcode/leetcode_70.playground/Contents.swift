import UIKit

/*
 You are climbing a stair case. It takes n steps to reach to the top.

 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

 Example 1:
 Input: 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 
 Example 2:
 Input: 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
 */

/// failed answer - Fermat's little theorem ( Runtime Error )
/// 掛け算割り算のOverflowしている模様
func climbStairs1(_ n: Int) -> Int {
    guard n != 0 else { return 0 }
    guard n != 1 else { return 1 }
    guard n != 2 else { return 2 }
    
    var counter = 0
    var twoStepCount = 0
    var twoStepTotal = 2*twoStepCount
    
    while twoStepTotal <= n {
        let oneStepCount = n - twoStepTotal
        let totalCount = oneStepCount + twoStepCount
        
        // ignore nC0, nCn
        guard twoStepCount != 0 && twoStepCount != totalCount else {
            twoStepCount += 1
            twoStepTotal = 2*twoStepCount
            counter += 1
            continue
        }
        // ignore nC1
        guard twoStepCount != 1 else {
            twoStepCount += 1
            twoStepTotal = 2*twoStepCount
            counter += totalCount
            continue
        }

        // Fermat's little theorem
        // totalCount C twoStepCount
        var result = 1
        for l in 1...totalCount {
            result *= l
        }
        for k in 1...twoStepCount {
            result /= k
        }
        for l_minus_k in 1...(totalCount-twoStepCount) {
            result /= l_minus_k
        }
        
        twoStepCount += 1
        twoStepTotal = 2*twoStepCount
        counter += result
        result = 1
    }
    
    return counter
}

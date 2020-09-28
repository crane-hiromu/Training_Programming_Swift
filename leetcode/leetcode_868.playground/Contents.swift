import UIKit

/*
 Given a positive integer N, find and return the longest distance between two consecutive 1's in the binary representation of N.

 If there aren't two consecutive 1's, return 0.

 Example 1:
 Input: 22
 Output: 2
 Explanation:
 22 in binary is 0b10110.
 In the binary representation of 22, there are three ones, and two consecutive pairs of 1's.
 The first consecutive pair of 1's have distance 2.
 The second consecutive pair of 1's have distance 1.
 The answer is the largest of these two distances, which is 2.
 
 Example 2:
 Input: 5
 Output: 2
 Explanation:
 5 in binary is 0b101.
 
 Example 3:
 Input: 6
 Output: 1
 Explanation:
 6 in binary is 0b110.
 
 Example 4:
 Input: 8
 Output: 0
 Explanation:
 8 in binary is 0b1000.
 There aren't any consecutive pairs of 1's in the binary representation of 8, so we return 0.
  
 Note:
 1 <= N <= 10^9
 */

/// answer1
func binaryGap1(_ N: Int) -> Int {
    var counter = 1, result = 0, oneCounter = 0
    
    for str in Array(String(N, radix: 2)) {
        if str == "1" {
            result = max(result, counter)
            counter = 1
            oneCounter += 1
        } else {
            counter += 1
        }
    }
    
    /// 1が ０,１回の場合を考慮
    if oneCounter < 2 {
        result = 0
    }
    
    return result
}

/// answer2 ( from solution )
func binaryGap2(_ N: Int) -> Int {
    var last = -1, ans = 0
    
    for i in 0..<32 {
        if 0 < (N>>i & 1) {
            if 0 <= last {
                ans = max(ans, i-last)
            }
            last = i
        }
    }
    
    return ans
}

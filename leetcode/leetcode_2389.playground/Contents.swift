/*
 You are given an integer array nums of length n, and an integer array queries of length m.
 Return an array answer of length m where answer[i] is the maximum size of a subsequence that you can take from nums such that the sum of its elements is less than or equal to queries[i].
 A subsequence is an array that can be derived from another array by deleting some or no elements without changing the order of the remaining elements.

 Example 1:
 Input: nums = [4,5,2,1], queries = [3,10,21]
 Output: [2,3,4]
 Explanation: We answer the queries as follows:
 - The subsequence [2,1] has a sum less than or equal to 3. It can be proven that 2 is the maximum size of such a subsequence, so answer[0] = 2.
 - The subsequence [4,5,1] has a sum less than or equal to 10. It can be proven that 3 is the maximum size of such a subsequence, so answer[1] = 3.
 - The subsequence [4,5,2,1] has a sum less than or equal to 21. It can be proven that 4 is the maximum size of such a subsequence, so answer[2] = 4.
 
 Example 2:
 Input: nums = [2,3,4,5], queries = [1]
 Output: [0]
 Explanation: The empty subsequence is the only subsequence that has a sum less than or equal to 1, so answer[0] = 0.

 Constraints:
 n == nums.length
 m == queries.length
 1 <= n, m <= 1000
 1 <= nums[i], queries[i] <= 106
 */

class Solution {
    func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
        var result = [Int]()
        let sortedNums = quickSort(nums)

        for query in queries {
            var sum = query

            for i in 0..<nums.count {
                sum -= sortedNums[i]

                if sum == 0 {
                    result.append(i+1)
                    break
                } else if sum < 0 {
                    result.append(i)
                    break
                }
            }

            guard 0 < sum else { continue }
            result.append(nums.count)
        }

        return result
    }

    func quickSort(_ nums: [Int]) -> [Int] {
        guard 1 < nums.count else { return nums }

        let pivot = nums[nums.count/2]
        let less = nums.filter { $0 < pivot }
        let equal = nums.filter { $0 == pivot }
        let greater = nums.filter { pivot < $0 }

        return quickSort(less) + equal + quickSort(greater)
    }
}

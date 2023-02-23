import UIKit

/*
 You are given an array of unique integers salary where salary[i] is the salary of the ith employee.
 Return the average salary of employees excluding the minimum and maximum salary. Answers within 10-5 of the actual answer will be accepted.

 Example 1:
 Input: salary = [4000,3000,1000,2000]
 Output: 2500.00000
 Explanation: Minimum salary and maximum salary are 1000 and 4000 respectively.
 Average salary excluding minimum and maximum salary is (2000+3000) / 2 = 2500
 
 Example 2:
 Input: salary = [1000,2000,3000]
 Output: 2000.00000
 Explanation: Minimum salary and maximum salary are 1000 and 3000 respectively.
 Average salary excluding minimum and maximum salary is (2000) / 1 = 2000
  
 Constraints:
 3 <= salary.length <= 100
 1000 <= salary[i] <= 106
 All the integers of salary are unique.
 */

class Solution {
    func average(_ salary: [Int]) -> Double {
        let sorted = quickSort(salary)
        var sum = 0

        for i in (1..<sorted.count-1) {
            sum += sorted[i]
        }

        return Double(sum) / Double(sorted.count-2)
    }

    func quickSort(_ nums: [Int]) -> [Int] {
        guard 1 < nums.count else { return nums }

        let pivot = nums[nums.count/2]
        let less = nums.filter { $0 < pivot }
        let equal = nums.filter { $0 == pivot }
        let greater = nums.filter { $0 > pivot }

        return quickSort(less) + equal + quickSort(greater)
    }
}

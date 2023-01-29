/*
 There is a class with m students and n exams. You are given a 0-indexed m x n integer matrix score, where each row represents one student and score[i][j] denotes the score the ith student got in the jth exam. The matrix score contains distinct integers only.

 You are also given an integer k. Sort the students (i.e., the rows of the matrix) by their scores in the kth (0-indexed) exam from the highest to the lowest.
 Return the matrix after sorting it.

 Example 1:
 Input: score = [[10,6,9,1],[7,5,11,2],[4,8,3,15]], k = 2
 Output: [[7,5,11,2],[10,6,9,1],[4,8,3,15]]
 Explanation: In the above diagram, S denotes the student, while E denotes the exam.
 - The student with index 1 scored 11 in exam 2, which is the highest score, so they got first place.
 - The student with index 0 scored 9 in exam 2, which is the second highest score, so they got second place.
 - The student with index 2 scored 3 in exam 2, which is the lowest score, so they got third place.
 
 Example 2:
 Input: score = [[3,4],[5,6]], k = 0
 Output: [[5,6],[3,4]]
 Explanation: In the above diagram, S denotes the student, while E denotes the exam.
 - The student with index 1 scored 5 in exam 0, which is the highest score, so they got first place.
 - The student with index 0 scored 3 in exam 0, which is the lowest score, so they got second place.
  
 Constraints:
 m == score.length
 n == score[i].length
 1 <= m, n <= 250
 1 <= score[i][j] <= 105
 score consists of distinct integers.
 0 <= k < n
 */

class Solution {
    typealias NumberInfo = (number: Int, prevIndex: Int)

    func sortTheStudents(_ score: [[Int]], _ k: Int) -> [[Int]] {
        let row = score.count, line = score[0].count

        /// transposed matrix
        let transposedScore = transposed(root: score)
        
        /// sort and keep previous index
        let params: [NumberInfo] = (0..<transposedScore[k].count).map { i in
            (number: transposedScore[k][i], prevIndex: i)
        }
        let sortedParams = quickSort(params)
        var _transposedScore = transposedScore

        for i in 0..<line {
            for j in 0..<row {
                _transposedScore[i][j] = transposedScore[i][sortedParams[j].prevIndex]
            }
        }

        /// transposed matrix (reverse)
        let result = transposed(root: _transposedScore)
        
        return result
    }

    /// ex
    /// [[1,2,3],[4,5,6]] -> [[1,4],[2,5],[3,6]]
    func transposed(root: [[Int]]) -> [[Int]] {
        let row = root.count, line = root[0].count
        var transposedScore = Array(
            repeating: Array(repeating: 0, count: row),
            count: line
        )
        for i in 0..<root.count {
            for j in 0..<root[0].count {
                transposedScore[j][i] = root[i][j]
            }
        }
        return transposedScore
    }

    func quickSort(_ info: [NumberInfo]) -> [NumberInfo] {
        guard 1 < info.count else { return info }

        let target = info[info.count/2]
        let pivot = target.number

        let less = info.filter { $0.number < pivot }
        let equal = info.filter { $0.number == pivot }
        let greater = info.filter { pivot < $0.number }

        return quickSort(greater) + equal + quickSort(less)
    }
}

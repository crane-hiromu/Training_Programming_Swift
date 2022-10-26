import UIKit

/*
 Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path.
 Note: You can only move either down or right at any point in time.

 Example 1:
 Input: grid = [[1,3,1],[1,5,1],[4,2,1]]
 Output: 7
 Explanation: Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.
 
 Example 2:
 Input: grid = [[1,2,3],[4,5,6]]
 Output: 12
  
 Constraints:
 m == grid.length
 n == grid[i].length
 1 <= m, n <= 200
 0 <= grid[i][j] <= 100
 */

func minPathSum(_ grid: [[Int]]) -> Int {
    var matrix: [[Int]] = grid
    let n = grid.count - 1
    let m = grid[0].count - 1
    
    for i in 0...n {
        for j in 0...m {
            var step = matrix[i][j]
    
            if 0 < i && 0 < j {
                step += min(matrix[i-1][j], matrix[i][j-1])
            } else if 0 < i && j == 0 {
                step += matrix[i-1][j]
            } else if 0 < j && i == 0 {
                step += matrix[i][j-1]
            }
            
            matrix[i][j] = step
        }
    }
    
    return matrix[n][m]
}

// backtrack - Time Limit Exceeded
func minPathSum2(_ grid: [[Int]]) -> Int {
    var result = Int.max
    backtrack(x: 0, y: 0, grid: grid, sum: grid[0][0], result: &result)
    return result
}

func backtrack(x: Int, y: Int, grid: [[Int]], sum: Int, result: inout Int) {
    let endX = grid.count-1
    let endY = grid[endX].count-1
    
    if x == endX, y == endY {
        result = min(result, sum)
        return
    }
    
    if x < endX {
        backtrack(x: x+1, y: y, grid: grid, sum: sum + grid[x+1][y], result: &result)    
    }
    if y < endY {
        backtrack(x: x, y: y+1, grid: grid, sum: sum + grid[x][y+1], result: &result)     
    }
}

import UIKit

/*
 An image is represented by an m x n integer grid image where image[i][j] represents the pixel value of the image.
 You are also given three integers sr, sc, and color. You should perform a flood fill on the image starting from the pixel image[sr][sc].

 To perform a flood fill, consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color), and so on. Replace the color of all of the aforementioned pixels with color.

 Return the modified image after performing the flood fill.

 Example 1:
 Input: image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, color = 2
 Output: [[2,2,2],[2,2,0],[2,0,1]]
 Explanation: From the center of the image with position (sr, sc) = (1, 1) (i.e., the red pixel), all pixels connected by a path of the same color as the starting pixel (i.e., the blue pixels) are colored with the new color.
 Note the bottom corner is not colored 2, because it is not 4-directionally connected to the starting pixel.
 
 Example 2:
 Input: image = [[0,0,0],[0,0,0]], sr = 0, sc = 0, color = 0
 Output: [[0,0,0],[0,0,0]]
 Explanation: The starting pixel is already colored 0, so no changes are made to the image.
  
 Constraints:
 m == image.length
 n == image[i].length
 1 <= m, n <= 50
 0 <= image[i][j], color < 216
 0 <= sr < m
 0 <= sc < n
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/// DFS
class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        let rCount = image.count, cCount = image[0].count
        var block: [[Bool]] = Array(repeating: Array(repeating: false, count: cCount), count: rCount)
        var _image = image
        dfs(&_image, &block, sr, sc, rCount, cCount, color, image[sr][sc])
        return _image
    }

    func dfs(_ image: inout [[Int]],
             _ block: inout [[Bool]],
             _ sr: Int,
             _ sc: Int,
             _ rCount: Int,
             _ cCount: Int,
             _ color: Int,
             _ target: Int) {

        // block[sr][sc] == false　：　一度選択したマスは２度と考慮しない
        // image[sr][sc] == target　：　隣のマスが同じマスか判断する
        guard
            (0...rCount-1).contains(sr),
            (0...cCount-1).contains(sc),
            block[sr][sc] == false,
            image[sr][sc] == target else { return }

        block[sr][sc] = true
        image[sr][sc] = color

        dfs(&image, &block, sr+1, sc, rCount, cCount, color, target)
        dfs(&image, &block, sr-1, sc, rCount, cCount, color, target)
        dfs(&image, &block, sr, sc+1, rCount, cCount, color, target)
        dfs(&image, &block, sr, sc-1, rCount, cCount, color, target)
    }
}

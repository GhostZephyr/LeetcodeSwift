class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        var x = m - 1, y = 0
        repeat {
            let value = matrix[x][y]
            if value == target {
                return true
            } else if value < target {
                y += 1
            } else {
                x -= 1
            }
        } while x >= 0 && y < n
        return false
    }   
}

let s = Solution()

var param = [[1, 4, 7, 11, 15], [2, 5, 8, 12, 19], [3, 6, 9, 16, 22], [10, 13, 14, 17, 24], [18, 21, 23, 26, 30]]
print("RS param:", param, "result:", s.searchMatrix(param, 5))
print("RS param:", param, "result:", s.searchMatrix(param, 22))
print("RS param:", param, "result:", s.searchMatrix(param, 25))
//
param = [[1,4],[2,5]]
print("RS param:", param, "result:", s.searchMatrix(param, 2))
param = [[-5]]
print("RS param:", param, "result:", s.searchMatrix(param, -5))

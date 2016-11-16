class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let length = matrix.count
        var edge = length - 1
        var nEdge = 0
        
        for row in 0..<edge {
            if edge >= row {
                nEdge = edge
                for col in row..<edge {
                    let val = matrix[row][col]
                    matrix[row][col] = matrix[nEdge][row]
                    matrix[nEdge][row] = matrix[edge][nEdge]
                    matrix[edge][nEdge] = matrix[col][edge]
                    matrix[col][edge] = val
                    nEdge -= 1
                }
                edge -= 1
            } else {
                break
            }
        }
    }
}

let s = Solution()
var matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
s.rotate(&matrix)
matrix.forEach { a in
    print(a)
}

class Solution {
    var isMatrixSearch = Dictionary<Int, Bool>()
    var isArraySearch = Dictionary<Int, Bool>()
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        return searchMatrix(matrix, target, matrix.count / 2)
    }
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int, _ index: Int) -> Bool {
        if isMatrixSearch[index] != nil {
            return false
        }
        isMatrixSearch[index] = true
        let array = matrix[index]
        let first = array.first!
        let last = array.last!
        if target > last {
            return searchMatrix(matrix, target, index + (matrix.count - index) / 2)
        } else if target < first {
            return searchMatrix(matrix, target, index / 2)
        } else if target >= first && target <= last {
            isArraySearch = Dictionary<Int, Bool>()
            return searchArray(array, target, array.count / 2)
        }
        return false
    }
    
    func searchArray(_ array: [Int], _ target: Int, _ index: Int) -> Bool {
        if isArraySearch[index] != nil {
            return false
        }
        isArraySearch[index] = true
        if target > array[index] {
            return searchArray(array, target, index + (array.count - index) / 2)
        } else if target < array[index] {
            return searchArray(array, target, index / 2)
        } else if target == array[index] {
            return true
        }
        return false
    }
}

let s = Solution()

//let param = [[0, 4, 5, 8], [9, 12, 15, 20], [22, 25, 28, 30], [33, 38, 48, 50], [53, 58, 59, 60], [63, 68, 78, 80]]
//let param = [[1]]
let param = [[1,3]]

print(s.searchMatrix(param, 1))



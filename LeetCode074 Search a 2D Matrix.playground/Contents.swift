class Solution {
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        return searchMatrix(matrix, target, matrix.count / 2, 0, matrix.count)
    }
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int, _ index: Int, _ start: Int, _ end: Int) -> Bool {
        let array = matrix[index]
        let first = array.first!
        let last = array.last!
        
        if target > last {
            let newStart = index
            let newEnd = end
            if checkIndexIsSearch(newStart, newEnd, index: index) {
                return false
            }
            return searchMatrix(matrix, target, (index + end) / 2, index, end)
        } else if target < first {
            let newStart = start
            let newEnd = index
            if checkIndexIsSearch(newStart, newEnd, index: index) {
                return false
            }
            return searchMatrix(matrix, target, (start + index) / 2, start, index)
        } else if target >= first && target <= last {
            return searchArray(array, target, array.count / 2, 0, array.count)
        }
        return false
    }
    
    func searchArray(_ array: [Int], _ target: Int, _ index: Int, _ start: Int, _ end: Int) -> Bool {
        if target > array[index] {
            let newStart = index
            let newEnd = end
            if checkIndexIsSearch(newStart, newEnd, index: index) {
                return false
            }
            return searchArray(array, target, (index + end) / 2, index, end)
        } else if target < array[index] {
            let newStart = start
            let newEnd = index
            if checkIndexIsSearch(newStart, newEnd, index: index) {
                return false
            }
            return searchArray(array, target, (start + index) / 2, start, index)
        } else if target == array[index] {
            return true
        }
        return false
    }
    
    func checkIndexIsSearch(_ start: Int, _ end: Int, index: Int) -> Bool {
        return (start + end) / 2 == index
    }
}

let s = Solution()

var param = [[0, 4, 5, 8], [9, 12, 15, 20], [22, 25, 28, 30], [33, 38, 48, 50], [53, 58, 59, 60], [63, 68, 78, 80]]
print("RS param:", param, "result:", s.searchMatrix(param, 33))


param = [[1]]
print("RS param:", param, "result:", s.searchMatrix(param, 1))

param = [[1,3]]
print("RS param:", param, "result:", s.searchMatrix(param, 2))

param = [[-10,-8],[-6,-5],[-2,-2],[-1,0],[3,4],[7,7],[8,9],[10,10],[11,11],[12,14],[15,16],[17,19],[20,21],[22,22],[25,27],[28,30],[32,32],[35,36]]
print("RS param:", param, "result:", s.searchMatrix(param, 16))



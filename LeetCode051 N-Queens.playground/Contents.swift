class Solution {
    
    var queenRs = Array<Array<Array<Int>>>()
    
    func solveNQueens(_ n: Int) -> [[String]] {
        var tables = Array<Array<Int>>()
        var canPutTables = Array<(Int, Int)>()
        for i in 0..<n {
            var table = Array<Int>()
            for j in 0..<n {
                table.append(0)
                let canPutItem = (i, j)
                canPutTables.append(canPutItem)
            }
            tables.append(table)
        }
        
        solveNQueensInTables(tables, 0, n, canPutTables)
        let result = queenRs.map { a in
            return a.flatMap { x in
                return getString(x)
            }
        }
        return result
    }
    
    func getString(_ intValue: [Int]) -> String {
        var rs = ""
        for i in intValue {
            rs.append(i == 0 ? "." : "Q")
        }
        return rs
    }
    
    func solveNQueensInTables(_ tables:[[Int]], _ currentIndex: Int, _ count: Int, _ canPutItems: Array<(Int, Int)>) -> Bool {
        if canPutItems.count == 0 {
            return false
        }
        
        if currentIndex == count {
            return true
        } else {
//            print("tables", tables, "curIndex", currentIndex, "count", count, "canPutItems", canPutItems)
            var nextPutItems = canPutItems
            let (m, n) = nextPutItems.first!
//            print("try put queen in", (m, n))
            nextPutItems.removeFirst()
            
            let newForPutItems = nextPutItems
            var tempItems = Array<(Int, Int)>()
            for (i, j) in newForPutItems {
//                print("i, j", (i, j), "m, n", (m, n))
                if i != m && j != n && (abs(i - m) != abs(j - n)) {
                    tempItems.append((i, j))
                }
            }
            
//            print("nextPutItems:", nextPutItems)
            
            if tempItems.count == 0 {
                if currentIndex + 1 == count {
                    
                    var nextTable = tables
                    nextTable[m][n] = 1
                    queenRs.append(nextTable)
                    
                    return false
                }
                
//                print("Can't put any Queen", tables, "return to m n", (m, n), "nextPutItems", newForPutItems)
                return solveNQueensInTables(tables, currentIndex, count, newForPutItems)
            } else {
                var nextTable = tables
                nextTable[m][n] = 1
//                print("Put queen in", (m, n))
                let rs = solveNQueensInTables(nextTable, currentIndex + 1, count, tempItems)
                if !rs {
//                    print("@@@@@@@@return to", tables, "can not put queen in", (m, n), "origin putItems", canPutItems)
                    return solveNQueensInTables(tables, currentIndex, count, newForPutItems)
                } else {
                    return rs
                }
            }
        }
    }
}

let s = Solution()
print(s.solveNQueens(4))


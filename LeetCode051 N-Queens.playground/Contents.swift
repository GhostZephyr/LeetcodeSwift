import Foundation

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
            var nextPutItems = canPutItems
            let (m, n) = nextPutItems.first!
            nextPutItems.removeFirst()
            
            let newForPutItems = nextPutItems
            var tempItems = Array<(Int, Int)>()
            for (i, j) in newForPutItems {
                if i != m && j != n && (abs(i - m) != abs(j - n)) {
                    tempItems.append((i, j))
                }
            }
            if tempItems.count == 0 {
                if currentIndex + 1 == count {
                    
                    var nextTable = tables
                    nextTable[m][n] = 1
                    queenRs.append(nextTable)
                    
                    return false
                }
                return solveNQueensInTables(tables, currentIndex, count, newForPutItems)
            } else {
                var nextTable = tables
                nextTable[m][n] = 1
                let rs = solveNQueensInTables(nextTable, currentIndex + 1, count, tempItems)
                if !rs {
                    return solveNQueensInTables(tables, currentIndex, count, newForPutItems)
                } else {
                    return rs
                }
            }
        }
    }
}




class SolutionTwo {
    
    var table = [Int]() //代表每行哪个位置放Queen
    var result = [[String]]()
    
    
    func solveNQueens(_ n: Int) -> [[String]] {
        for _ in 0..<n {
            table.append(-1)
        }
        
        var i = 0, j = 0
        var isPut = false
        while i < n {
            isPut = false
            for x in j..<n {
                if canPutInRowN(i, x) {
                    table[i] = x
                    i += 1 //可以放置 试探下一行
                    j = 0
                    isPut = true
                    break
                }
            }
            
            if !isPut {
                table[i] = -1
                i -= 1
                if i == -1 {
                    break
                } else {
                    j = table[i] + 1
                }
            }
            
            if i == -1 {
                break //已查出所有的解
            }
            
            if i == n {
                let rs = table.map { num -> String in
                    var str = ""
                    for i in 0..<n {
                        if i == num {
                            str.append("Q")
                        } else {
                            str.append(".")
                        }
                    }
                    return str
                }
                
                result.append(rs)
                
                i -= 1
                j = table[i] + 1
            }
            
        }
        
        return result
    }

    func canPutInRowN(_ m: Int, _ n: Int) -> Bool {
        for i in 0..<m {
            if table[i] == -1 {
                return true
            }
            if ((table[i] == n)
                || abs(i - m) == abs(table[i] - n)) {
                return false;
            }
        }
        return true;
    }
}


var beforeDate = Date()
let s = SolutionTwo()
print(s.solveNQueens(8))
print(Date().timeIntervalSince(beforeDate) * 1000)


let s2 = Solution()
beforeDate = Date()
print(s2.solveNQueens(6))
print(Date().timeIntervalSince(beforeDate) * 1000)


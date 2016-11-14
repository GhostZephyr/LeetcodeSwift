import Foundation

class Solution {
    
    var table = [Int]() //代表每行哪个位置放Queen
    var result = 0
    
    
    func totalNQueens(_ n: Int) -> Int {
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
                result += 1
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



let s = Solution()
var beforeDate = Date()
print(s.totalNQueens(8))
print(Date().timeIntervalSince(beforeDate) * 1000)


class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        let l = s.characters.count
        let space = numRows - 2
        let other = space * numRows - space
        let singleSpace = numRows + space
        let num = l / singleSpace
        let leftNum = l % singleSpace
        
        let columnCount = num + (leftNum > 0 ? 1 : 0)
        
        print("singleSpace", singleSpace)
        
        return ""
    }
}

let solution = Solution()
let rs = solution.convert("PAYPALISHIRING", 4)
print(rs)
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var map = Dictionary<Int, Int>()
        
        for (_, value) in nums.enumerated() {
            if map[value] != nil {
                map[value]! += 1
            } else {
                map[value] = 1
            }
        }

        print(map)
        let rs = map.sorted { (a: (k1: Int, v1: Int), b: (k2: Int, v2: Int)) -> Bool in
            return a.v1 > b.v2
        }
        
        let slice = rs.prefix(k)
        return slice.map { (key, value) -> Int in
            return key
        }
    }
}

let s = Solution()
print(s.topKFrequent([8,1,5,2,3,6,8,9,11,32,32,32,32,44], 2))
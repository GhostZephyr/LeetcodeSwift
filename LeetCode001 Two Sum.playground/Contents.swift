

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

    var map = Dictionary<Int, Int>()
    
    for i in 0 ..< nums.count {
        let temp = target - nums[i]
        if (map.index(forKey: temp) != nil) {
            return [map[temp]!, i]
        }
        map[nums[i]] = i
    }
    
    return [0, 1]
}

//print(twoSum([2,1,9,4,4,56,90,3], 8))
//print(twoSum([3,4,2], 6))
//print(twoSum([0,4,3,0], 0))
//print(twoSum([-1,-2,-3,-4,-5], -8))

 
 
 func findMedian(_ i: Int,
                 _ j: Int,
                 _ nums1: [Int],
                 _ nums2: [Int],
                 _ min: Int,
                 _ max: Int) -> Double {
    if i < nums1.count && nums2[j - 1] > nums1[i] {
        
        let newMin = i + 1
        let newI = (newMin + max) / 2
        let newJ = (nums1.count + nums2.count + 1) / 2 - newI
        return findMedian(newI, newJ, nums1, nums2, newMin, max)
    } else if i > 0 && nums1[i - 1] > nums2[j] {
        let newMax = i - 1
        let newI = (newMax + min) / 2
        let newJ = (nums1.count + nums2.count + 1) / 2 - newI
        return findMedian(newI, newJ, nums1, nums2, min, newMax)
    } else {
        var maxLeft = 0.0, minRight = 0.0
        if i == 0 {
            maxLeft = Double(nums2[j - 1])
        } else if j == 0 {
            maxLeft = Double(nums1[i - 1])
        } else {
            maxLeft = Double(nums1[i - 1] > nums2[j - 1] ? nums1[i - 1] : nums2[j - 1])
        }
        
        if (nums1.count + nums2.count) % 2 == 1 {
            return maxLeft
        }
        if i == nums1.count {
            minRight = Double(nums2[j])
        } else if j == nums2.count {
            minRight = Double(nums1[i])
        } else {
            minRight = Double(nums1[i] < nums2[j] ? nums1[i] : nums2[j])
        }
        return (maxLeft + minRight) / 2.0
    }
 }
 
 func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    
    var a = nums1, b = nums2
    if nums1.count > nums2.count {
        a = nums2
        b = nums1
        let m = a.count, n = b.count
        let max = m, min = 0
        let i = (min + max) / 2
        let j = (m + n + 1) / 2 - i
        return findMedian(i, j, a, b, min, max)
    } else {
        let m = a.count, n = b.count
        let max = m, min = 0
        let i = (min + max) / 2
        let j = (m + n + 1) / 2 - i
        return findMedian(i, j, a, b, min, max)
    }
    
 }
 print(findMedianSortedArrays([], [2, 3]))
 print(findMedianSortedArrays([1, 3], [2]))
 print(findMedianSortedArrays([4, 5, 6, 8, 9], []))

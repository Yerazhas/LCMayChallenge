/**You are given a sorted array consisting of only integers where every element appears exactly twice, except for one element which appears exactly once. Find this single element that appears only once.

 

Example 1:

Input: [1,1,2,3,3,4,4,8,8]
Output: 2
Example 2:

Input: [3,3,7,7,10,11,11]
Output: 10
 

Note: Your solution should run in O(log n) time and O(1) space.*/

class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        let high = nums.count - 1
        let low = 0
        return singleElement(nums, low, high)
    }
    
    func singleElement(_ nums: [Int], _ low: Int, _ high: Int) -> Int {
        if high < low {
            return -1
        }
        if low == high {
            return nums[low]
        }
        
        let mid = low + (high - low) / 2
        if mid % 2 == 0 {
            if nums[mid] == nums[mid + 1] {
                return singleElement(nums, mid+2, high)
            } else {
                return singleElement(nums, low, mid)
            }
        } else {
            if nums[mid] == nums[mid - 1] {
                return singleElement(nums, mid+1, high)
            } else {
                return singleElement(nums, low, mid-1)
            }
        }
    }
}

import UIKit

//Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
//
//You may assume that the array is non-empty and the majority element always exist in the array.
//
//Example 1:
//
//Input: [3,2,3]
//Output: 3
//Example 2:
//
//Input: [2,2,1,1,1,2,2]
//Output: 2

func majorityElement(_ nums: [Int]) -> Int {
    var hashMap = [Int: Int]()
    let size = nums.count / 2
    for num in nums {
        let count = hashMap[num] ?? 0
        if count == size {
            return num
        }
        hashMap[num] = count + 1
    }
    return -1
}

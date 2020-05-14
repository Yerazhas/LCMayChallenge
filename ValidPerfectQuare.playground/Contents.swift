/**Given a positive integer num, write a function which returns True if num is a perfect square else False.

Note: Do not use any built-in library function such as sqrt.

Example 1:

Input: 16
Output: true
Example 2:

Input: 14
Output: false*/

class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        let rem = num % 10
        if [2,3,7,8].contains(rem) {
            return false
        }
        var l = 1
        var r = num
        while l <= r {
            let mid = l + (r - l) / 2
            let sq = mid * mid
            if sq == num {
                return true
            } else if (sq < num) {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return false
    }
}

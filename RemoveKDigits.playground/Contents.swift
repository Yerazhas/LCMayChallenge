/**Given a non-negative integer num represented as a string, remove k digits from the number so that the new number is the smallest possible.

Note:

The length of num is less than 10002 and will be ≥ k.
The given num does not contain any leading zero.
Example 1:

Input: num = "1432219", k = 3
Output: "1219"
Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
Example 2:

Input: num = "10200", k = 1
Output: "200"
Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.
Example 3:

Input: num = "10", k = 2
Output: "0"
Explanation: Remove all the digits from the number and it is left with nothing which is 0.*/

class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        if k == num.count {
            return "0"
        }
        var str = Array(num)
        for j in 0..<k {
            var i = 0
            while(i < str.count - 1 && str[i] <= str[i + 1]) {
                i += 1
            }
            str.remove(at: i)
        }
        
        while(str.count > 1 && str[0] == "0") {
            str.remove(at: 0)
        }
        if str.count == 0 {
            return "0"
        }
        return String(str)
    }
}

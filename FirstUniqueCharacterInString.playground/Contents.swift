import UIKit

//Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
//
//Examples:
//
//s = "leetcode"
//return 0.
//
//s = "loveleetcode",
//return 2.
//Note: You may assume the string contain only lowercase letters.

func firstUniqChar(_ s: String) -> Int {
    var hashMap = [Character: Int]()
    var characters = [Character]()
    for char in s {
        hashMap[char] = (hashMap[char] ?? 0) + 1
        characters.append(char)
    }
    
    for i in 0..<characters.count {
        let char = characters[i]
        if hashMap[char] ?? 0 == 1 {
            return i
        }
    }
    return -1
}

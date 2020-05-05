
//Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.
//
//Each letter in the magazine string can only be used once in your ransom note.
//
//Note:
//You may assume that both strings contain only lowercase letters.
//
//canConstruct("a", "b") -> false
//canConstruct("aa", "ab") -> false
//canConstruct("aa", "aab") -> true

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    if ransomNote == "" {
        return true
    }
    var hashMap = [Character: Int]()
    for char in magazine {
        hashMap[char] = (hashMap[char] ?? 0) + 1
    }
    for char in ransomNote {
        if let number = hashMap[char] {
            if number > 1 {
                hashMap[char] = number - 1
            } else {
                hashMap[char] = nil
            }
        } else {
            return false
        }
    }
    
    return true
}

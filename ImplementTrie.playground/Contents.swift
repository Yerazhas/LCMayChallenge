/**Implement a trie with insert, search, and startsWith methods.

Example:

Trie trie = new Trie();

trie.insert("apple");
trie.search("apple");   // returns true
trie.search("app");     // returns false
trie.startsWith("app"); // returns true
trie.insert("app");
trie.search("app");     // returns true
Note:

You may assume that all inputs are consist of lowercase letters a-z.
All inputs are guaranteed to be non-empty strings.*/


final class Trie {
    let root: TrieNode
    
    init() {
        root = TrieNode()
    }
    
    func insert(_ word: String) {
        guard !word.isEmpty else { return }
        var currentNode = root
        var currentIndex = 0
        let characters = Array(word)
        let count = word.count
        while currentIndex < count {
            let character = characters[currentIndex]
            if let child = currentNode.children[character] {
                currentNode = child
            } else {
                currentNode.add(character)
                currentNode = currentNode.children[character]!
            }
            currentIndex += 1
            if currentIndex == count {
              currentNode.isTerminating = true
            }
        }
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var currentNode = root
        var currentIndex = 0
        let count = word.count
        let characters = Array(word)
        while currentIndex < count, let child = currentNode.children[characters[currentIndex]] {
            currentIndex += 1
            currentNode = child
        }
        
        return currentIndex == count && currentNode.isTerminating
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var currentNode = root
        var currentIndex = 0
        let count = prefix.count
        let characters = Array(prefix)
        while currentIndex < count {
            let character = characters[currentIndex]
            if currentNode.children[character] == nil {
                return false
            }
            currentNode = currentNode.children[character]!
            currentIndex += 1
        }
        
        return true
    }
}

final class TrieNode {
    
    weak var parent: TrieNode?
    var value: Character?
    var children = [Character: TrieNode]()
    var isTerminating = false
    
    init(_ value: Character, _ parent: TrieNode?) {
        self.value = value
        self.parent = parent
    }
    
    init() {}
    
    func add(_ child: Character) {
        guard children[child] == nil else { return }
        children[child] = TrieNode(child, self)
    }
}
/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */

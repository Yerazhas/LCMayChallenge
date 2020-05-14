/**In a binary tree, the root node is at depth 0, and children of each depth k node are at depth k+1.

Two nodes of a binary tree are cousins if they have the same depth, but have different parents.

We are given the root of a binary tree with unique values, and the values x and y of two different nodes in the tree.

Return true if and only if the nodes corresponding to the values x and y are cousins.*/


class Solution {
    var ddd = 0
    
    func isCousins(_ root: TreeNode?, _ x: Int, _ y : Int) -> Bool {
        var px: TreeNode? = dfs(root, nil, x, 0, 1)
        var py: TreeNode? = dfs(root, nil, y, 0, -1)
        return x != y && px != nil && py != nil && px?.val != py?.val && ddd == 0
    }

    func dfs(_ root: TreeNode?, _ par: TreeNode?, _ x: Int, _ dep: Int, _ mul: Int) -> TreeNode? {
        if root == nil {
            return nil
        }
        if root?.val == x {
            ddd += dep * mul
            return par
        }
        var res: TreeNode? = dfs(root?.left, root, x, dep + 1, mul)
        if res != nil {
            return res
        }
        res = dfs(root?.right, root, x, dep + 1, mul)
        return res
    }
}

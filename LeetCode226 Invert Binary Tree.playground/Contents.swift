public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        let tempNode = root?.left
        root?.left = invertTree(root?.right)
        root?.right = invertTree(tempNode)
        return root
    }
    
    
}

let s = Solution()

var tree = { () -> TreeNode in 
    let node1 = TreeNode(5)
    let node2 = TreeNode(3)
    let node3 = TreeNode(8)
    let node4 = TreeNode(9)
    let node5 = TreeNode(0)
    let node6 = TreeNode(1)
    let node7 = TreeNode(3)
    let node8 = TreeNode(4)
    let node9 = TreeNode(7)
    
    node1.left = node2
    node1.right = node3
    
    node2.left = node8
    node2.right = node9
    
    node3.left = node4
    node3.right = node5
    node4.left = node6
    node4.right = node7
    
    return node1
}



s.invertTree(tree())
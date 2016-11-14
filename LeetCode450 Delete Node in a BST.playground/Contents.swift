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
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        print("root?.val", root?.val ?? 0, "key", key)
        if root?.left == nil && root?.right == nil || key == -1 {
            print("null")
            root?.left = nil
            root?.right = nil
            return nil
        }
        
        if root?.left != nil {
            if root?.left?.val == key {
                print("root?.left?.val == key", root?.left?.val ?? 0, "value", (root?.left?.left?.val) ?? -1)
                root?.left = deleteNode(root?.left, (root?.left?.left?.val) ?? -1)
                print("after LeftVal", (root?.left?.val) ?? -1 )
                return root
            } else {
                root?.left = deleteNode(root?.left, key)
            }
        }
        
        if root?.left == nil && root?.right != nil {
            if root?.right?.val == key {
                print("root?.right?.val == key", root?.right?.val ?? -1)
                root?.right = deleteNode(root?.right, (root?.right?.right?.val) ?? -1)
                return root
            } else {
                root?.right = deleteNode(root?.right, key)
            }
        }
        
        return root
    }
}

func printNode(_ treeNode: TreeNode) {
    if treeNode.left == nil && treeNode.right == nil {
        print("nil")
        return
    }
    print(treeNode.val)
    printNode(treeNode.left ?? TreeNode(-1))
    printNode(treeNode.right ?? TreeNode(-1))
}

var node1 = TreeNode(5)
var node2 = TreeNode(3)
var node3 = TreeNode(6)
var node4 = TreeNode(2)
var node5 = TreeNode(4)
var node6 = TreeNode(7)


node1.left = node2
node1.right = node3
node2.left = node4
node2.right = node5
node3.left = nil
node3.right = node6
//[5,3,6,2,4,null,7]
//3

let s = Solution()
printNode(s.deleteNode(node1, 3) ?? TreeNode(0))





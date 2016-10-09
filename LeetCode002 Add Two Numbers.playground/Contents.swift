/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var temp1: ListNode? = l1
    var temp2: ListNode? = l2
    let resultNode = ListNode(0)
    var tempResult = resultNode
    
    while (temp1 != nil || temp2 != nil) {
        if temp1 == nil && temp2 != nil {
            
            tempResult.val += (temp2?.val)!
            print("temp1 nil temp2Val", temp2?.val, "tempResultVal", tempResult.val)
            
        } else if (temp2 == nil && temp1 != nil) {
            print("temp2 nil")
            tempResult.val += (temp1?.val)!
        } else if (temp1 != nil && temp2 != nil) {
            
            tempResult.val += (temp1?.val)! + (temp2?.val)!
            print("no nil", tempResult)
        } else {
            print("break")
            break
        }
        
        if tempResult.val >= 10 {
            print(">10 before")
            tempResult.next = ListNode(tempResult.val / 10)
            tempResult.val = tempResult.val % 10
            print(">10 after")
        }
        
        temp1 = temp1?.next
        temp2 = temp2?.next
        if temp1 != nil || temp2 != nil {
            if tempResult.next == nil {
                tempResult.next = ListNode(0)
            }
            tempResult = tempResult.next!
        }
    }
    return resultNode
}


func getArrayFromListNode(_ node: ListNode?) -> [Int] {
    var tempArray: [Int] = [(node?.val)!]
    var x = node
    
    while x?.next != nil {
        x = x?.next
        tempArray.append((x?.val)!)
        
    }
    
    //    print(tempArray)
    return tempArray
}

var a = ListNode(1)
var b = ListNode(9)
var c = ListNode(9)

var d = ListNode(3)
var e = ListNode(3)
var f = ListNode(3)

var g = ListNode(9)
var h = ListNode(9)

a.next = b
b.next = c

d.next = e
e.next = f
f.next = g
g.next = h
print("aNode", getArrayFromListNode(a), "dNode", getArrayFromListNode(d))
print("result", getArrayFromListNode(addTwoNumbers(a, d)))


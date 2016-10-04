/* Subset Sum Solution
 I think this solution operates in O(n^k) where k is the target */

import UIKit

let globalTargets = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]
var sumEx: Double = 0
var result = [[Int]]()
let searchSet = [1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
var correctSubsets = [[Int]]()

/* Uncomment all for analyzing time increase due to increasing target */

for newTarget in globalTargets {
    let start = NSDate().timeIntervalSince1970
    
    
    let globalTarget = newTarget //newTarget for time analysis
    
    func sums(var i: Int, target: Int) {
        var j = target - i
        while j-i >= 1 {
            if target == globalTarget {result.append([i, j])}
            else { copyAndReplaceTarget(i, j: j, target: target) }
            sums(i+1, target: j)
            i += 1
            j -= 1
        }
    }
    
    func copyAndReplaceTarget(i: Int, j: Int, target: Int) {
        let s = NSDate().timeIntervalSince1970
        for subArray in result {
            if subArray.contains(target) {
                var newArray = Array(subArray)
                if let index = newArray.indexOf(target) { newArray.removeAtIndex(index) }
                newArray.append(i)
                newArray.append(j)
                result.append(newArray)
            }
        }
        let d = NSDate().timeIntervalSince1970
        let execution = d - s
        let add = NSTimeInterval.init(floatLiteral: execution)
        sumEx += add
    }
    
    sums(1, target: globalTarget)
    
    let end = NSDate().timeIntervalSince1970
    let execution = end - start
}

func findSubsets() { // Polynomial Time
    for set in result {
        var flag = true
        for val in set {
            if !searchSet.contains(val) {
                flag = false
                continue
            }
        }
        if flag { correctSubsets.append(set) }
    }
}

findSubsets()

print(result.count)

print(result)

print(correctSubsets.count)

print(correctSubsets)

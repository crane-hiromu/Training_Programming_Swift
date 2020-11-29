import UIKit

/*
 Given an integer array arr. You have to sort the integers in the array in ascending order by the number of 1's in their binary representation and in case of two or more integers have the same number of 1's you have to sort them in ascending order.

 Return the sorted array.

 Example 1:
 Input: arr = [0,1,2,3,4,5,6,7,8]
 Output: [0,1,2,4,8,3,5,6,7]
 Explantion: [0] is the only integer with 0 bits.
 [1,2,4,8] all have 1 bit.
 [3,5,6] have 2 bits.
 [7] has 3 bits.
 The sorted array by bits is [0,1,2,4,8,3,5,6,7]
 
 Example 2:
 Input: arr = [1024,512,256,128,64,32,16,8,4,2,1]
 Output: [1,2,4,8,16,32,64,128,256,512,1024]
 Explantion: All integers have 1 bit in the binary representation, you should just sort them in ascending order.
 
 Example 3:
 Input: arr = [10000,10000]
 Output: [10000,10000]
 
 Example 4:
 Input: arr = [2,3,5,7,11,13,17,19]
 Output: [2,3,5,17,7,11,13,19]
 
 Example 5:
 Input: arr = [10,100,1000,10000]
 Output: [10,100,10000,1000]
  
 Constraints:
 1 <= arr.length <= 500
 0 <= arr[i] <= 10^4
 */

/// answer1
func sortByBits1(_ arr: [Int]) -> [Int] {
    var hash = [Int: [Int]]()
    
    for num in arr {
        var bit = num, counter = 0

        while bit != 0 {
            if bit & 1 == 1 {
                counter += 1
            }
            bit = bit >> 1
        }
        
        if var dic = hash[counter] {
            dic.append(num)
            hash[counter] = dic
        } else {
            hash[counter] = [num]
        }
    }

    return hash.sorted { $0.0 < $1.0 }.map { $0.value.sorted() }.flatMap { $0 }
}

/// answer2 (with merge sort)
func sortByBits2(_ arr: [Int]) -> [Int] {
    var hash = [Int: [Int]]()
    
    for num in arr {
        var bit = num, counter = 0

        while bit != 0 {
            if bit & 1 == 1 {
                counter += 1
            }
            bit = bit >> 1
        }
        
        if var dic = hash[counter] {
            dic.append(num)
            hash[counter] = dic
        } else {
            hash[counter] = [num]
        }
    }
    
    var result = [Int]()
    for key in mergeSort(list: Array(hash.keys)) {
        var val = hash[key]!
        val = mergeSort(list: val)
        result.append(contentsOf: val)
    }
    
    return result
}

func merge(left:[Int],right:[Int]) -> [Int] {
    var mergedList = [Int]()
    var left = left
    var right = right

    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            mergedList.append(left.removeFirst())
        } else {
            mergedList.append(right.removeFirst())
        }
    }

    return mergedList + left + right
}

func mergeSort(list:[Int]) -> [Int] {
    guard list.count > 1 else {
        return list
    }

    let leftList = Array(list[0..<list.count/2])
    let rightList = Array(list[list.count/2..<list.count])

    return merge(left: mergeSort(list:leftList), right: mergeSort(list:rightList))
}

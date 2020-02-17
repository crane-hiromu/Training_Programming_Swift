import UIKit

/* Q1 0の連番が最大値を返す */

/* 頭が０からの場合は丸め込まれる想定 */

func takeOutMaxCountOfLinedUpZero(from indexes: Int) -> Int {
    let indexArray = "\(indexes)".compactMap { Int("\($0)") }
    
    var max: Int = 0
    var counter: Int = 0
    
    indexArray.forEach {
        if $0 == 0 {
            counter += 1
            max = (max < counter) ? counter : max
        } else {
            counter = 0
        }
    }
    
    return max
}

takeOutMaxCountOfLinedUpZero(from: 110001101) // 3
takeOutMaxCountOfLinedUpZero(from: 1100010000010001) // 5
takeOutMaxCountOfLinedUpZero(from: 0001100010000) // 4



/* Q2 ２つを取り出して合計8を作れるかどうか */

func hasPair(in data: [Int]) -> Bool {
    return data.enumerated().first { offset, index in
        return data.enumerated().first { $0.offset != offset && $0.element + index == 8 } != nil
    } != nil
}

hasPair(in: [1,2,3,9]) // false
hasPair(in: [1,2,4,4]) // true




/// sort

func sortInt(_ items: [Int]) -> [Int] {
    var sortedItems = items
    for i in 0 ..< sortedItems.count {
        var j = i
        while j > 0 && sortedItems[j-1] > sortedItems[j] {
            let temp = sortedItems[j-1]
            sortedItems[j-1] = sortedItems[j]
            sortedItems[j] = temp
            j -= 1
        }
    }
    return sortedItems
}

func sortArray() {
    let array = Array(1...100)
    
    var first = array
    var second = array
    var third = array
    
    let startTime1 = CFAbsoluteTimeGetCurrent()
    first.sorted()
    let timeElapsed1 = CFAbsoluteTimeGetCurrent() - startTime1
    print("1: \(timeElapsed1) seconds")
    print(first)
    
    
    let startTime2 = CFAbsoluteTimeGetCurrent()
    sortInt(second)
    let timeElapsed2 = CFAbsoluteTimeGetCurrent() - startTime2
    print("2: \(timeElapsed2) seconds")
    print(second)
    
    
//    let startTime3 = CFAbsoluteTimeGetCurrent()
////    let hh = second.withContiguousMutableStorageIfAvailable { $0.baseAddress!.pointee }
//
//    let timeElapsed3 = CFAbsoluteTimeGetCurrent() - startTime3
//    print("3: \(timeElapsed2) seconds")
//    print(third)
    
}

sortArray()



//
//func swapByPointer<T>(x: UnsafeMutablePointer<T>, y: UnsafeMutablePointer<T>) {
//    let z: T = x.pointee
//    x.pointee = y.pointee
//    y.pointee = z
//}
//
//var a: Int = 10
//var b: Int = 20
//
//// a = 10, b = 20
//print("a = \(a), b = \(b)")
//
//// Swap
//swapByPointer(&a, &b)
//
//// a = 20, b = 10
//print("a = \(a), b = \(b)")

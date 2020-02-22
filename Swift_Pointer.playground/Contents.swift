import UIKit
import Foundation

// MARK: - UnsafePointer

/*
 暗黙の変換によるポインタの有効範囲は該当の関数のスコープ内のみ
 関数からポインタを返してそれを利用するのは禁止(というのがお作法)
 以下は可能だがやってはいけない。（関数ないなら良い）
 */

var number = 5
let numberPointer = UnsafePointer<Int>(&number)


// MARK: - UnsafeMutablePointer

// convert Int to UnsafeMutablePointer<Int>
var mNumber = 23
let ptr: UnsafeMutablePointer<Int> = UnsafeMutablePointer<Int>(&mNumber)
print(ptr.pointee == 23) /// true
print(ptr[0] == 23) /// true
print(ptr[1] == 23) /// false

// multiple int
var bytes: [UInt] = [39, 77, 111, 111, 102, 33, 39, 0]
let uint8Pointer = UnsafeMutablePointer<UInt>.allocate(capacity: 8) // メモリーの確保
uint8Pointer.initialize(from: &bytes, count: 8) // メモリーとバインド

print(uint8Pointer.pointee) // 39
print(uint8Pointer[0]) // 39
print(uint8Pointer[1]) // 77
print(uint8Pointer[2]) // 111

// length
let length = uint8Pointer.withMemoryRebound(to: Int8.self, capacity: 8) {
    return strlen($0)
}
print(length)

// intPointer
var intNumbers =  [10, 20, 30, 40]
let intPointer = UnsafeMutablePointer<Int>(&intNumbers)

print(intPointer.pointee) // 10
print(intPointer[0]) // 10

intPointer[0] = 50
print(intPointer[0]) // 50

// ポインタ演算
let offsetPointer = intPointer + 2
print(offsetPointer.pointee) // 30

// print pointer
func printInt(atAddress p: UnsafePointer<Int>) {
    print(p.pointee)
}

/// ex1
var val: Int = 5
var valPointer = UnsafePointer<Int>(&val)
printInt(atAddress: valPointer) ///  "5"

/// ex2
var value: Int = 23
printInt(atAddress: &value) ///  "23"

/// ex3
let numbers = [5, 10, 15, 20]
printInt(atAddress: numbers) ///  "5"



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
    
    let first = array
    let second = array
    
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
}

//sortArray()


// pointer and input

// 1
func swapByPointer<T>(x: UnsafeMutablePointer<T>, y: UnsafeMutablePointer<T>) {
    let z: T = x.pointee
    x.pointee = y.pointee
    y.pointee = z
}
func execSwapByPointer() {
    let st = CFAbsoluteTimeGetCurrent()
    
    var a: Int = 10
    var b: Int = 20
    swapByPointer(x: &a, y: &b)
    
    let et = CFAbsoluteTimeGetCurrent() - st
    print("\(et) seconds")
}

// 2
func swapIntByPointer(x: UnsafeMutablePointer<Int>, y: UnsafeMutablePointer<Int>) {
    let z = x.pointee
    x.pointee = y.pointee
    y.pointee = z
}
func execSwapIntByPointer() {
    let st = CFAbsoluteTimeGetCurrent()
    
    var c: Int = 10
    var d: Int = 20
    swapIntByPointer(x: &c, y: &d)
    
    let et = CFAbsoluteTimeGetCurrent() - st
    print("\(et) seconds")
}

// 3
func swapByInout<T>(x: inout T, y: inout T) {
    let z: T = x
    x = y
    y = z
}
func execSwapByInout() {
    let st = CFAbsoluteTimeGetCurrent()
    
    var e: Int = 10
    var f: Int = 20
    swapByInout(x: &e, y: &f)
    
    let et = CFAbsoluteTimeGetCurrent() - st
    print("\(et) seconds")
}

// 4
func swapIntByInout(x: inout Int, y: inout Int) {
    let z = x
    x = y
    y = z
}
func execSwapIntByInout() {
    let st = CFAbsoluteTimeGetCurrent()
    
    var g: Int = 10
    var h: Int = 20
    swapIntByInout(x: &g, y: &h)
    
    let et = CFAbsoluteTimeGetCurrent() - st
    print("\(et) seconds")
}

// exec
//execSwapByPointer()
//execSwapIntByPointer()
//execSwapByInout()
//execSwapIntByInout()



// Test

//var intNumbers =  [10, 20, 30, 40]
//let intPointer = UnsafeMutablePointer<Int>(&intNumbers)

func runLoopNumbers() {
    let start = Date()
    
    var sum = 0
    for i in (0...1000) {
        sum += i
    }
    
    print(Date().timeIntervalSince(start))
}

func runLoopPointerNumbers() {
    let start = Date()
    
    var sum = 0
    let sumPointer = UnsafeMutablePointer<Int>(&sum)
    
    for i in (0...1000) {
        sumPointer.pointee += i
    }
    
    print(Date().timeIntervalSince(start))
}

func execLoops() {
    for _ in (0...10) {
        runLoopNumbers()
    }
    for _ in (0...10) {
        runLoopPointerNumbers()
    }
}

execLoops()




/// https://leetcode.com/problems/two-sum/

/// question
/// var nums = [2, 7, 11, 15], target = 9
/// print(twoSum(nums, target))

//normal
//24ms
func twoSum0(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0 ..< nums.count {
        let j = i+1
        
        while j < nums.count {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return []
}


// Quick
// 8ms
func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    var keyValue = [Int: Int]()
    
    for (i, num) in nums.enumerated() {
        if let index = keyValue[target-num] {
            return [i, index]
        }
        keyValue[num] = i
    }
    return []
}


// pointer
// 8ms
func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    var nNums = nums
    let nPointer = UnsafeMutablePointer<Int>(&nNums)
    
    for i in 0 ..< nums.count {
        var j = i+1
        
        while j < nums.count {
            if nPointer[i] + nPointer[j] == target {
                return [i, j]
            }
            j += 1
        }
    }
    return []
}

// pointer
// 16ms
func twoSum3(_ nums: [Int], _ target: Int) -> [Int] {
    var nNums = nums
    var nPointer = UnsafeMutablePointer<Int>(&nNums)
    
    for i in 0 ..< nums.count {
        for j in i+1 ..< nums.count {
            let mPointer = nPointer + j - i
            
            if nPointer.pointee + mPointer.pointee == target {
                return [i, j]
            }
        }
        nPointer += 1
    }
    return []
}


var nums = [3, 2, 4], target = 6
print(twoSum0(nums, target))



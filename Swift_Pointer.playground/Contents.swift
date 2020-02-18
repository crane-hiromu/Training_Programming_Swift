import UIKit

// MARK: - UnsafePointer

// convert Int to UnsafePointer<Int>
var number = 5
let numberPointer = UnsafePointer<Int>(&number)

// print pointer
func printInt(atAddress p: UnsafePointer<Int>) {
    print(p.pointee)
}

/// ex1
printInt(atAddress: numberPointer) ///  "5"

/// ex2
var value: Int = 23
printInt(atAddress: &value) ///  "23"

/// ex3
let numbers = [5, 10, 15, 20]
printInt(atAddress: numbers) ///  "5"


// MARK: - UnsafeMutablePointer

// convert Int to UnsafeMutablePointer<Int>
var mNumber = 23
let ptr: UnsafeMutablePointer<Int> = UnsafeMutablePointer<Int>(&mNumber)
print(ptr.pointee == 23) /// true
print(ptr[0] == 23) /// true
print(ptr[1] == 23) /// false

// multiple int
var bytes: [UInt] = [39, 77, 111, 111, 102, 33, 39, 0]
let uint8Pointer = UnsafeMutablePointer<UInt>.allocate(capacity: 8)
uint8Pointer.initialize(from: &bytes, count: 8)

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

let offsetPointer = intPointer + 2
print(offsetPointer.pointee) // 30

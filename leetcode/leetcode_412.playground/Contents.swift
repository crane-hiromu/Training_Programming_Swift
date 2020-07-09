import UIKit

/*
 Write a program that outputs the string representation of numbers from 1 to n.

 But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.

 Example:
 n = 15,

 Return:
 [
     "1",
     "2",
     "Fizz",
     "4",
     "Buzz",
     "Fizz",
     "7",
     "8",
     "Fizz",
     "Buzz",
     "11",
     "Fizz",
     "13",
     "14",
     "FizzBuzz"
 ]
 */

func fizzBuzz(_ n: Int) -> [String] {
    var result = [String]()
    
    for i in (1...n) {
        if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
            result.append("FizzBuzz")
        } else if i.isMultiple(of: 3) {
            result.append("Fizz")
        } else if i.isMultiple(of: 5) {
            result.append("Buzz")
        } else {
            result.append("\(i)")
        }
    }
    return result
}

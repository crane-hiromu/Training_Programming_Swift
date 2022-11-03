/*
 You are given a string of length 5 called time, representing the current time on a digital clock in the format "hh:mm". The earliest possible time is "00:00" and the latest possible time is "23:59".
 In the string time, the digits represented by the ? symbol are unknown, and must be replaced with a digit from 0 to 9.
 Return an integer answer, the number of valid clock times that can be created by replacing every ? with a digit from 0 to 9.

 Example 1:
 Input: time = "?5:00"
 Output: 2
 Explanation: We can replace the ? with either a 0 or 1, producing "05:00" or "15:00". Note that we cannot replace it with a 2, since the time "25:00" is invalid. In total, we have two choices.
 
 Example 2:
 Input: time = "0?:0?"
 Output: 100
 Explanation: Each ? can be replaced by any digit from 0 to 9, so we have 100 total choices.
 
 Example 3:
 Input: time = "??:??"
 Output: 1440
 Explanation: There are 24 possible choices for the hours, and 60 possible choices for the minutes. In total, we have 24 * 60 = 1440 choices.
  
 Constraints:
 time is a valid string of length 5 in the format "hh:mm".
 "00" <= hh <= "23"
 "00" <= mm <= "59"
 Some of the digits might be replaced with '?' and need to be replaced with digits from 0 to 9.
 */

/*
 Hour
 "??:xx" -> 24 pattern
 "?H:xx" -> 0,1,2 -> 3 pattern (if H is less than 4)
 "H?:xx" -> 0,1..8,9 -> 10 pattern (if H is not 2)
 "HH:xx" -> 1 pattrn

 Minute
 "xx:?M" -> 6 pattrn
 "xx:M?" -> 10 pattrn
 */

func countTime(_ time: String) -> Int {
    let array = Array(time)
    let h1 = array[0], h2 = array[1], m1 = array[3], m2 = array[4]
    
    let pattern: Int = {
        switch (h1, h2) {
        case ("?", "?"): return 24
        case ("?",   _): return (Int(String(h2))! < 4) ? 3 : 2
        case (  _, "?"): return (h1 == "2" ? 4 : 10)
        case (  _,   _): return 1
        }
    }()
    
    return pattern
         * (m1 == "?" ? 6 : 1)
         * (m2 == "?" ? 10 : 1)
}

import UIKit

/*
 You are given a 2D integer array logs where each logs[i] = [birthi, deathi] indicates the birth and death years of the ith person.

 The population of some year x is the number of people alive during that year. The ith person is counted in year x's population if x is in the inclusive range [birthi, deathi - 1]. Note that the person is not counted in the year that they die.

 Return the earliest year with the maximum population.

 Example 1:
 Input: logs = [[1993,1999],[2000,2010]]
 Output: 1993
 Explanation: The maximum population is 1, and 1993 is the earliest year with this population.
 
 Example 2:
 Input: logs = [[1950,1961],[1960,1971],[1970,1981]]
 Output: 1960
 Explanation:
 The maximum population is 2, and it had happened in years 1960 and 1970.
 The earlier year between them is 1960.
  
 Constraints:
 1 <= logs.length <= 100
 1950 <= birthi < deathi <= 2050
 */

// brute force
func maximumPopulation(_ logs: [[Int]]) -> Int {
    var maximum = 0, year = logs[0][0]

    for i in (0..<logs.count) {
        var birthPopulation = 0, deathPopulation = 0
        
        logs.forEach {
            birthPopulation += ($0[0]..<$0[1]).contains(logs[i][0]) ? 1 : 0
            deathPopulation += ($0[0]..<$0[1]).contains(logs[i][1]) ? 1 : 0
        }
        
        if maximum < birthPopulation {
            maximum = birthPopulation
            year = logs[i][0]
        } else if maximum == birthPopulation {
            year = min(logs[i][0], year)
        }
        
        if maximum < deathPopulation {
            maximum = deathPopulation
            year = logs[i][1]
        } else if maximum == deathPopulation {
            year = min(logs[i][1], year)
        }
    }
    
    return year
}

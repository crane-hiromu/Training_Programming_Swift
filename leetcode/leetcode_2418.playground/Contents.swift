import UIKit

// hashmap
func sortPeople(_ names: [String], _ heights: [Int]) -> [String] {
    guard !heights.isEmpty else { return [] }
    
    var dict = [Int: String]()
    
    for i in (0..<heights.count) {
        dict[heights[i]] = names[i]
    }
    
    return dict.sorted { $0.key > $1.key }.map { $0.value }
}

// more swify
func sortPeople2(_ names: [String], _ heights: [Int]) -> [String] {
    zip(names, heights).sorted(by: { $0.1 > $1.1 }).map(\.0)
}

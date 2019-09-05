import UIKit

/* 0の連番が最大値を返す */

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
            max = (max < counter) ? counter : max
            counter = 0
        }
    }
    
    return max
}

takeOutMaxCountOfLinedUpZero(from: 110001101) // 3
takeOutMaxCountOfLinedUpZero(from: 1100010000010001) // 5
takeOutMaxCountOfLinedUpZero(from: 0001100010000) // 4

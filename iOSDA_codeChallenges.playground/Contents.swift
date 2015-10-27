import UIKit

var arrayPreReversal: [Int] = [0, 1, 2, 3, 4, 5]

func reverseArray() -> [Int]{
    var arrayPostReversal = [Int]()
    
    for (var index = arrayPreReversal.count - 1 ; index >= 0; index--) {
        arrayPostReversal.append(arrayPreReversal[index])
    }
    return arrayPostReversal
}

reverseArray()
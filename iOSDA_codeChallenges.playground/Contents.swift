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


for (var index = 1; index <= 10; index++){
    print(index)
}

var array = ["a", "b", "c", "d", "e", "f"]

for (var index = 0; index <= array.count - 1; index++){
    print(array[index])
}

for string in array {
    print(string)
}
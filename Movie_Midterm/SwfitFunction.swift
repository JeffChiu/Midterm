import Foundation


func sortArray(array1:[Int], array2:[Int]) -> [Int] {
    var resultArray: [Int] = []
    var count = 0
    
    //step 1 : filter duplicate array item
    for num in array1 {
        if (!resultArray.contains(num)){
            resultArray.append(num)
        }
    }
    for num in array2 {
        if (!resultArray.contains(num)){
            resultArray.append(num)
        }
    }
    
    //step 2 : sort
    count = resultArray.count
    var temp :Int
    for i in 0..<count-1 {
        for j in 0..<count-1-i {
            if (resultArray[j] > resultArray[j+1]) {
                temp = resultArray[j]
                resultArray[j] = resultArray[j+1]
                resultArray[j+1] = temp
            }
        }
    }
    
    return resultArray
}




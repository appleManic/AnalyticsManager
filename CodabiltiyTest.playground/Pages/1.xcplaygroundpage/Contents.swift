//: [Previous](@previous)

import Foundation

/*
 
 **/
extension Array where Element == Int {
    public static func +(array1: [Int], array2: [Int]) -> [Int] {
        let count = Swift.max(array1.count, array2.count)
        
        var result = [Int]()
        
        for i in 0..<count {
            let value1 = i < array1.count ? array1[i]:0
            let value2 = i < array2.count ? array2[i]:0
            
            let absValue1 = abs(value1)
            let absValue2 = abs(value2)
            
            result.append(absValue1+absValue2)
        }
        return result

    }
}



let a1 = [-1,2]
let a2 = [1,2,3,4]

let result = [1,2] + [1,2,3,4]
print(result)
//: [Next](@next)

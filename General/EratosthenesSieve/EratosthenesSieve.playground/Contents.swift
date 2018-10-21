import Foundation

// Including max number
func sieveIncluding(max: Int) -> [Int] {
    guard max > 1 else { return [] }
    
    var sieve = [Bool](repeating: true, count: max + 1)
    
    sieve[0] = false
    sieve[1] = false
    
    for i in 2...max where sieve[i] == true {
        for j in stride(from: i*i, through: max, by: i) {
            sieve[j] = false
        }
    }
    
    return sieve.enumerated().compactMap { $1 == true ? $0 : nil }
}

sieveIncluding(max: 23) // [2, 3, 5, 7, 11, 13, 17, 19, 23]

// Not including max number
func sieveNotIncluding(max: Int) -> [Int] {
    guard max > 1 else { return [] }
    
    var sieve = [Bool](repeating: true, count: max)
    
    sieve[0] = false
    sieve[1] = false
    
    for i in 2..<max where sieve[i] == true {
        for j in stride(from: i*i, to: max, by: i) {
            sieve[j] = false
        }
    }
    
    return sieve.enumerated().compactMap { $1 == true ? $0 : nil }
}

sieveNotIncluding(max: 23) // [2, 3, 5, 7, 11, 13, 17, 19]



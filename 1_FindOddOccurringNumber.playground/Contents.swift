/*
 Problem:
 You are given an array of repeating numbers.
 All numbers repeat in an even way, except for one.
 Find that odd occurring number.
*/

let array = [1, 2, 3, 9, 3, 2, 1]

func findOdd1(_ array: [Int]) -> Int? {
    var table = [Int: Int]()
    array.forEach {
        if let count = table[$0] {
            table[$0] = count + 1
        } else {
            table[$0] = 1
        }
    }
    for pair in table {
        if pair.value % 2 != 0 {
            return pair.key
        }
    }
    return nil
}

findOdd1(array)
assert(findOdd1(array) == 9, "Error happened")
// Time Complexity is O(n) + O(n) because of two for loop,
// but it gives O(2n) that is equivalent to O(n)

// Optimized s0lution
func findOdd2(_ array: [Int]) -> Int? {
    var table = [Int: Bool]()
    array.forEach {
        if table[$0] != nil {
            table[$0] = nil
        } else {
            table[$0] = true
        }
    }
    return table.keys.first
}

findOdd2(array)
assert(findOdd2(array) == 9, "Error happened")
// Time Complexity is O(n) - we remove one for loop.


let array = [19, 2, 66, 4, 45, 99, 101, 3, 5, 7, 17, 35, 42]
let sortedArray = [2, 3, 4, 5, 7, 17, 19, 35, 42, 45, 66, 99, 101]

func bubbleSort1(array: [Int]) -> [Int] {
    var result = array
    let n = result.count
    var counter = 0
    for _ in 0..<(n - 1) {
        for j in 0..<(n - 1) {
            counter += 1
            if result[j] > result[j + 1] {
                let temp = result[j]
                result[j] = result[j + 1]
                result[j + 1] = temp
            }
        }
    }
    print("Count of operations in bubbleSort1: \(counter)")
    return result
}

let result1 = bubbleSort1(array: array)
// Count of operations in bubbleSort1: 144
assert(result1 == sortedArray, "Error happened!")

func bubbleSort2(array: [Int]) -> [Int] {
    var result = array
    let n = result.count
    var counter = 0
    for i in 0..<(n - 1) {
        for j in 0..<(n - i - 1) {
            counter += 1
            if result[j] > result[j + 1] {
                result.swapAt(j, j + 1)
            }
        }
    }
    print("Count of operations in bubbleSort2: \(counter)")
    return result
}

let result2 = bubbleSort2(array: array)
// Count of operations in bubbleSort2: 78
assert(result2 == sortedArray, "Error happened!")


bubbleSort2(array: sortedArray)

func bubbleSort3(array: [Int]) -> [Int] {
    var result = array
    let n = result.count
    var counter = 0
    var isSwapped: Bool
    for i in 0..<(n - 1) {
        isSwapped = false
        for j in 0..<(n - i - 1) {
            counter += 1
            if result[j] > result[j + 1] {
                result.swapAt(j, j + 1)
                isSwapped = true
            }
        }
        if !isSwapped {
            break
        }
    }
    print("Count of operations in bubbleSort3: \(counter)")
    return result
}

let result3 = bubbleSort3(array: array)
// Count of operations in bubbleSort3: 63
assert(result3 == sortedArray, "Error happened!")

bubbleSort3(array: sortedArray)


func bubbleSort4(array: [Int]) -> [Int] {
    var result = array
    var counter = 0
    let n = result.count
    var lastUnsorted = n - 1
    var isSorted = false
    while (!isSorted) {
        isSorted = true
        for i in 0..<(lastUnsorted) {
            counter += 1
            if result[i] > result[i + 1] {
                result.swapAt(i, i + 1)
                isSorted = false
            }
         }
        lastUnsorted -= 1
    }
    print("Count of operations in bubbleSort4: \(counter)")
    return result
}

let result4 = bubbleSort4(array: array)
// Count of operations in bubbleSort3: 63
assert(result4 == sortedArray, "Error happened!")

bubbleSort4(array: sortedArray)

// Comparable:
// A type that can be compared using the relational operators <, <=, >=, and >.
func genericBubbleSort<T: Comparable>(list: [T]) -> [T] {
    var result = list
    let n = result.count
    var lastUnsorted = n - 1
    var isSorted = false
    while (!isSorted) {
        isSorted = true
        for i in 0..<lastUnsorted {
            if result[i] > result[i + 1] {
                result.swapAt(i, i + 1)
                isSorted = false
            }
        }
        lastUnsorted -= 1
    }
    return result
}

let stringsArray = ["China", "Japan", "Brazil", "Russia", "Ireland"]
genericBubbleSort(list: stringsArray)
// ["Brazil", "China", "Ireland", "Japan", "Russia"]


extension Array where Element: Comparable {
    
    func bubbleSort() -> [Element] {
        var result = self
        let n = result.count
        var lastUnsorted = n - 1
        var isSorted = false
        while (!isSorted) {
            isSorted = true
            for i in 0..<lastUnsorted {
                if result[i] > result[i + 1] {
                    result.swapAt(i, i + 1)
                    isSorted = false
                }
            }
            lastUnsorted -= 1
        }
        return result
    }
}

[19, 2, 66, 4, 45, 99, 101, 3, 5, 7, 17, 35, 42].bubbleSort()
// [2, 3, 4, 5, 7, 17, 19, 35, 42, 45, 66, 99, 101]
["China", "Japan", "Brazil", "Russia", "Ireland"].bubbleSort()
// ["Brazil", "China", "Ireland", "Japan", "Russia"]

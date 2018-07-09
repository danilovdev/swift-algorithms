
let array = [1, 7, 5, 9, 2, 12, 3]
let k = 2

// first solution - O(nˆ2)
func bruteForce(array: [Int], k: Int) -> (Int, [(Int, Int)]) {
    var counter = 0
    var result = [(Int, Int)]()
    for i in 0..<array.count {
        for j in 0..<array.count where i != j {
            if array[i] - array[j] == k {
                counter += 1
                result += [(array[i], array[j])]
            }
        }
    }
    return (counter, result)
}

//let result = bruteForce(array: array, k: k)
//print(result)

// second solution - O(nlogn)
func sortingBinarySearch(array: [Int], k: Int) -> (Int, [(Int, Int)]) {
    var counter = 0
    var result = [(Int, Int)]()
    let sortedArray = array.sorted()
    for i in 0..<sortedArray.count {
        let target = sortedArray[i] - k
        if let component = binarySearch(array: sortedArray, target: target),
            component.index != i {
            counter += 1
            result += [(sortedArray[i], target)]
        }
    }
    return (counter, result)
}

func binarySearch(array: [Int], target: Int) -> (index: Int, value: Int)? {
    var lower = 0
    var upper = array.count - 1
    while (lower <= upper) {
        let midIndex = lower + (upper - lower) / 2
        let midValue = array[midIndex]
        if midValue == target {
            return (midIndex, midValue)
        } else if midValue < target {
            lower = midIndex + 1
        } else {
            upper = midIndex - 1
        }
    }
    return nil
}

//let result = sortingBinarySearch(array: array, k: k)
//print(result)

// third solution - use dictionary - O(n)

func hashing(array: [Int], k: Int) -> (Int, [(Int, Int)]) {
    var counter = 0
    var result = [(Int, Int)]()
    var hashSet = Set<Int>()
    for i in 0..<array.count {
        hashSet.insert(array[i])
    }
    for i in 0..<array.count {
        let component = array[i] - k
        if hashSet.contains(component) {
            counter += 1
            result += [(array[i], component)]
        }
    }
    return (counter, result)
}

//let result = hashing(array: array, k: 2)
//print(result)









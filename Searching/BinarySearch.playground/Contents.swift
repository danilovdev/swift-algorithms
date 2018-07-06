let array = [45, 42, 75, 61, 37, 95, 30, 19, 81, 77, 44, 54, 8, 88, 85, 46, 39, 35, 65, 3]

func linearSearch(array: [Int], target: Int) -> Bool {
    for i in 0..<(array.count - 1) {
        if array[i] == target {
            return true
        }
    }
    return false
}

linearSearch(array: array, target: 65) // true
linearSearch(array: array, target: 68) // false
assert(true == linearSearch(array: array, target: 65), "Error happened")
assert(false == linearSearch(array: array, target: 68), "Error happened")

func binarySearchRecursive(array: [Int], target: Int, left: Int, right: Int) -> Bool {
    if left > right {
        return false
    }
    let midIndex = left + (right - left) / 2
    let midValue = array[midIndex]
    if midValue == target {
      return true
    } else if (target > midValue) {
        let newLeft = midIndex + 1
        return binarySearchRecursive(array: array, target: target, left: newLeft, right: right)
    } else {
        let newRight = midIndex - 1
        return binarySearchRecursive(array: array, target: target, left: left, right: newRight)
    }
}

func binarySearch(array: [Int], target: Int) -> Bool {
    let left = 0
    let right = array.count - 1
    return binarySearchRecursive(array: array, target: target, left: left, right: right)
}


let sortedArray = [3, 8, 19, 30, 35, 37, 39, 42, 44, 45, 46, 54, 61, 65, 75, 77, 81, 85, 88, 95]
binarySearch(array: sortedArray, target: 88) // true
binarySearch(array: sortedArray, target: 89) // false
assert(true == binarySearch(array: sortedArray, target: 88), "Error happened")
assert(false == binarySearch(array: sortedArray, target: 89), "Error happened")


func binarySearchRecursive(array: [Int], target: Int, range: Range<Int>) -> Bool {
    if range.lowerBound >= range.upperBound {
        return false
    }
    let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    print(midIndex)
    let midValue = array[midIndex]
    if midValue == target {
        return true
    } else if (target > midValue) {
        let newRange: Range<Int> = (midIndex + 1)..<range.upperBound
        return binarySearchRecursive(array: array, target: target, range: newRange)
    } else {
        let newRange: Range<Int> = (range.lowerBound)..<midIndex
        return binarySearchRecursive(array: array, target: target, range: newRange)
    }
}

//let sortedArray = [3, 8, 19, 30, 35, 37, 39, 42, 44, 45, 46, 54, 61, 65, 75, 77, 81, 85, 88, 95]
binarySearchRecursive(array: sortedArray, target: 88, range: 0..<sortedArray.count) // true
binarySearchRecursive(array: sortedArray, target: 89, range: 0..<sortedArray.count) // false

func binarySearchRecursive<T: Comparable>(array: [T], target: T, range: Range<Int>) -> Bool {
    if range.lowerBound >= range.upperBound {
        return false
    }
    let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    print(midIndex)
    let midValue = array[midIndex]
    if midValue == target {
        return true
    } else if (target > midValue) {
        let newRange: Range<Int> = (midIndex + 1)..<range.upperBound
        return binarySearchRecursive(array: array, target: target, range: newRange)
    } else {
        let newRange: Range<Int> = (range.lowerBound)..<midIndex
        return binarySearchRecursive(array: array, target: target, range: newRange)
    }
}

binarySearchRecursive(array: sortedArray, target: 81, range: 0..<array.count)
let strings = ["aa", "bb", "cc", "dd", "ee"]
binarySearchRecursive(array: strings, target: "dd", range: 0..<strings.count)


func binarySearchIterative<T: Comparable>(array: [T], target: T) -> Bool {
    var lower = 0
    var upper = array.count
    while (lower <= upper) {
        let midIndex = lower + (upper - lower) / 2
        let midValue = array[midIndex]
        if midValue == target {
            return true
        } else if target > midValue {
            lower = midIndex + 1
        } else {
            upper = midIndex - 1
        }
    }
    return false
}

//let sortedArray = [3, 8, 19, 30, 35, 37, 39, 42, 44, 45, 46, 54, 61, 65, 75, 77, 81, 85, 88, 95]
binarySearchIterative(array: sortedArray, target: 81) // true
binarySearchIterative(array: sortedArray, target: 82) // false


extension Array where Element: Comparable {
    
    func binarySearch(target: Element) -> Bool {
        var lower = 0
        var upper = self.count
        while (lower <= upper) {
            let midIndex = lower + (upper - lower) / 2
            let midValue = self[midIndex]
            if midValue == target {
                return true
            } else if target > midValue {
                lower = midIndex + 1
            } else {
                upper = midIndex - 1
            }
        }
        return false
    }
}

//let sortedArray = [3, 8, 19, 30, 35, 37, 39, 42, 44, 45, 46, 54, 61, 65, 75, 77, 81, 85, 88, 95]
sortedArray.binarySearch(target: 81) // true
sortedArray.binarySearch(target: 82) // false

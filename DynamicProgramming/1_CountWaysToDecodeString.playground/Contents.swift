
var gc = 0

func decodeHelper(str: String, n: Int) -> Int {
//    gc += 1
//    print("in RR: \(gc)")
    if n == 0 { return 1 }
    
    let s = str.count - n
    let sIndex = str.index(str.startIndex, offsetBy: s)
    if str[sIndex] == "0" { return 0 }
    
    var result = decodeHelper(str: str, n: n - 1)
    if n >= 2 {
        let startIndex = str.index(str.startIndex, offsetBy: s)
        let finishIndex = str.index(str.startIndex, offsetBy: s + 2)
        let subStr = str[startIndex..<finishIndex]
        if let subInt = Int(subStr), subInt <= 26 {
            result += decodeHelper(str: str, n: n - 2)
        }
    }
    
    return result
}

func decode(str: String) -> Int {
    return decodeHelper(str: str, n: str.count)
}

decode(str: "111111")

func decodeHelperDynamic(str: String, n: Int, memo: inout [Int]) -> Int {
//    gc += 1
//    print("in DP: \(gc)")
    if n == 0 { return 1 }
    
    let s = str.count - n
    let sIndex = str.index(str.startIndex, offsetBy: s)
    if str[sIndex] == "0" { return 0 }
    
    if memo[n] != -1 {
//        print("\(n): \(memo[n])") 
        return memo[n]
    }
    
    var result = decodeHelperDynamic(str: str, n: n - 1, memo: &memo)
    if n >= 2 {
        let startIndex = str.index(str.startIndex, offsetBy: s)
        let finishIndex = str.index(str.startIndex, offsetBy: s + 2)
        let subStr = str[startIndex..<finishIndex]
        if let subInt = Int(subStr), subInt <= 26 {
            result += decodeHelperDynamic(str: str, n: n - 2, memo: &memo)
        }
    }
    memo[n] = result
    print(memo)
    return result
}

func decodeDynamic(str: String) -> Int {
    let n = str.count
    var memo = Array(repeating: -1, count: n + 1)
    return decodeHelperDynamic(str: str, n: n, memo: &memo)
}

//decode(str: "1234567812345678912345678")
decodeDynamic(str: "1234567812345678912345678")





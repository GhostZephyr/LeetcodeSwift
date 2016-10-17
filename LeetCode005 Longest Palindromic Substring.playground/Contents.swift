extension String {
    
    subscript (r: CountableClosedRange<Int>) -> String {
        get {
            let startIndex =  self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
            return self[startIndex...endIndex]
        }
    }
}

func longestPalindrome(_ s: String) -> String {
    let newStr = getManacherStr(s)
    var position:[Int], maxRight = 0, maxIndex = 0
    
    let len = newStr.characters.count
    
    position = [Int]()
    var (maxI, half) = (0, 0)
    for (i, _) in newStr.characters.enumerated() {
        if position.count <= i {
            position.append(i)
        }
        var p = maxRight > i && 2 * maxIndex - 1 < position.count ? min(position[2 * maxIndex - 1], maxRight - i) : 1
        
        
        while i + p < len && i - p >= 0 && (newStr[newStr.index(newStr.startIndex, offsetBy: i + p)] == newStr[newStr.index(newStr.startIndex, offsetBy: i - p)]) {
            p += 1
        }
        position[i] = p
        
        if(p > half) {
            half = p
            maxI = i
        }
        if i + position[i] > maxRight {
            maxRight = i + position[i]
            maxIndex = i
        }
    }
    let startS = maxI / 2 - (half - 1) / 2
    let endS = startS + half - 2
    return s[startS...endS]
}

func getManacherStr(_ s: String) -> String {
    var newStr = "#"
    for (_, item) in s.characters.enumerated() {
        newStr += String(item) + "#"
        
    }
    return newStr
}

//print(longestPalindrome("tattarrattat"))
//print(longestPalindrome("affddffadfdfdfaaffddaasaf"))
//print(longestPalindrome("afdf"))
//print(longestPalindrome("a"))

print(longestPalindrome("esbtzjaaijqkgmtaajpsdfiqtvxsgfvijpxrvxgfumsuprzlyvhclgkhccmcnquukivlpnjlfteljvykbddtrpmxzcrdqinsnlsteonhcegtkoszzonkwjevlasgjlcquzuhdmmkhfniozhuphcfkeobturbuoefhmtgcvhlsezvkpgfebbdbhiuwdcftenihseorykdguoqotqyscwymtjejpdzqepjkadtftzwebxwyuqwyeegwxhroaaymusddwnjkvsvrwwsmolmidoybsotaqufhepinkkxicvzrgbgsarmizugbvtzfxghkhthzpuetufqvigmyhmlsgfaaqmmlblxbqxpluhaawqkdluwfirfngbhdkjjyfsxglsnakskcbsyafqpwmwmoxjwlhjduayqyzmpkmrjhbqyhongfdxmuwaqgjkcpatgbrqdllbzodnrifvhcfvgbixbwywanivsdjnbrgskyifgvksadvgzzzuogzcukskjxbohofdimkmyqypyuexypwnjlrfpbtkqyngvxjcwvngmilgwbpcsseoywetatfjijsbcekaixvqreelnlmdonknmxerjjhvmqiztsgjkijjtcyetuygqgsikxctvpxrqtuhxreidhwcklkkjayvqdzqqapgdqaapefzjfngdvjsiiivnkfimqkkucltgavwlakcfyhnpgmqxgfyjziliyqhugphhjtlllgtlcsibfdktzhcfuallqlonbsgyyvvyarvaxmchtyrtkgekkmhejwvsuumhcfcyncgeqtltfmhtlsfswaqpmwpjwgvksvazhwyrzwhyjjdbphhjcmurdcgtbvpkhbkpirhysrpcrntetacyfvgjivhaxgpqhbjahruuejdmaghoaquhiafjqaionbrjbjksxaezosxqmncejjptcksnoq"))



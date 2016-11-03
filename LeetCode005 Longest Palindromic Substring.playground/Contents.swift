extension String {
    
    subscript (r: CountableClosedRange<Int>) -> String {
        get {
            let startIndex =  self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
            return self[startIndex...endIndex]
        }
    }
    
    func charAt(_ index: Int) -> Character {
        return self.characters[self.index(self.startIndex, offsetBy: index)]
    }
}

class SolutionManacher {
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
            
            while i + p < len && i - p >= 0 && (newStr.charAt(i + p) == newStr.charAt(i - p)) {
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
}


class SolutionExpandAroundCenter {
    func longestPalindrome(_ s: String) -> String {
        var start = 0, end = 0
        for (i, _) in s.characters.enumerated() {
            let l1 = expandAroundCenter(s, i, i)
            let l2 = expandAroundCenter(s, i, i + 1)
            let l = max(l1, l2)
            if l > end - start {
                start = i - (l - 1) / 2
                end = i + l / 2
            }
        }
        return s[start...end]
    }
    
    func expandAroundCenter(_ s: String, _ left: Int, _ right: Int) -> Int {
        var l = left, r = right
        let count = s.characters.count
        while (l >= 0 && r < count && s.charAt(l) == s.charAt(r)) {
            l -= 1;
            r += 1;
        }
        return r - l - 1;
    }
}



//print(longestPalindrome("tattarrattat"))
//print(longestPalindrome("affddffadfdfdfaaffddaasaf"))
//print(longestPalindrome("afdf"))
//print(longestPalindrome("a"))

var sm = SolutionManacher()
var se = SolutionExpandAroundCenter()

//var testStr = "esbtzjaaijqkgmtaajpsdfiqtvxsgfvijpxrvxgfumsuprzlyvhclgkhccmcnquukivlpnjlfteljvykbddtrpmxzcrdqinsnlsteonhcegtkoszzonkwjevlasgjlcquzuhdmmkhfniozhuphcfkeobturbuoefhmtgcvhlsezvkpgfebbdbhiuwdcftenihseorykdguoqotqyscwymtjejpdzqepjkadtftzwebxwyuqwyeegwxhroaaymusddwnjkvsvrwwsmolmidoybsotaqufhepinkkxicvzrgbgsarmizugbvtzfxghkhthzpuetufqvigmyhmlsgfaaqmmlblxbqxpluhaawqkdluwfirfngbhdkjjyfsxglsnakskcbsyafqpwmwmoxjwlhjduayqyzmpkmrjhbqyhongfdxmuwaqgjkcpatgbrqdllbzodnrifvhcfvgbixbwywanivsdjnbrgskyifgvksadvgzzzuogzcukskjxbohofdimkmyqypyuexypwnjlrfpbtkqyngvxjcwvngmilgwbpcsseoywetatfjijsbcekaixvqreelnlmdonknmxerjjhvmqiztsgjkijjtcyetuygqgsikxctvpxrqtuhxreidhwcklkkjayvqdzqqapgdqaapefzjfngdvjsiiivnkfimqkkucltgavwlakcfyhnpgmqxgfyjziliyqhugphhjtlllgtlcsibfdktzhcfuallqlonbsgyyvvyarvaxmchtyrtkgekkmhejwvsuumhcfcyncgeqtltfmhtlsfswaqpmwpjwgvksvazhwyrzwhyjjdbphhjcmurdcgtbvpkhbkpirhysrpcrntetacyfvgjivhaxgpqhbjahruuejdmaghoaquhiafjqaionbrjbjksxaezosxqmncejjptcksnoq"

var testStr = "vaomxdtiuwqlwhgutkhxxhccsgvyoaccuicgybnqnslogtqhblegfudagpxfvjdacsxgevvepuwthdtybgflsxjdmmfumyqgpxatvdypjmlapccaxwkuxkilqqgpihyepkilhlfkdrbsefinitdcaghqmhylnixidrygdnzmgubeybczjceiybowglkywrpkfcwpsjbkcpnvfbxnpuqzhotzspgebptnhwevbkcueyzecdrjpbpxemagnwmtwikmkpqluwmvyswvxghajknjxfazshsvjkstkezdlbnkwxawlwkqnxghjzyigkvqpapvsntojnxlmtywdrommoltpbvxwqyijpkirvndwpgufgjelqvwffpuycqfwenhzrbzbdtupyutgccdjyvhptnuhxdwbmdcbpfvxvtfryszhaakwshrjseonfvjrrdefyxefqfvadlwmedpvnozobftnnsutegrtxhwitrwdpfienhdbvvykoynrsbpmzjtotjxbvemgoxreiveakmmbbvbmfbbnyfxwrueswdlxvuelbkrdxlutyukppkzjnmfmclqpkwzyylwlzsvriwomchzzqwqglpflaepoxcnnewzstvegyaowwhgvcwjhbbstvzhhvghigoazbjiikglbqlxlccrwqvyqxpbtpoqjliziwmdkzfsrqtqdkeniulsavsfqsjwnvpprvczcujihoqeanobhlsvbzmgflhykndfydbxatskf"

//var testStr = "lphbehiapswjudnbcossedgioawodnwdruaaxhbkwrxyzaxygmnjgwysafuqbmtzwdkihbwkrjefrsgjbrycembzzlwhxneiijgzidhngbmxwkhphoctpilgooitqbpjxhwrekiqupmlcvawaiposqttsdgzcsjqrmlgyvkkipfigttahljdhtksrozehkzgshekeaxezrswvtinyouomqybqsrtegwwqhqivgnyehpzrhgzckpnnpvajqevbzeksvbezoqygjtdouecnhpjibmsgmcqcgxwzlzztdneahixxhwwuehfsiqghgeunpxgvavqbqrelnvhnnyqnjqfysfltclzeoaletjfzskzvcdwhlbmwbdkxnyqappjzwlowslwcbbmcxoiqkjaqqwvkybimebapkorhfdzntodhpbhgmsspgkbetmgkqlolsltpulgsmyapgjeswazvhxedqsypejwuzlvegtusjcsoenrcmypexkjxyduohlvkhwbrtzjnarusbouwamazzejhnetfqbidalfomecehfmzqkhndpkxinzkpxvhwargbwvaeqbzdhxzmmeeozxxtzpylohvdwoqocvutcelgdsnmubyeeeufdaoznxpvdiwnkjliqtgcmvhilndcdelpnilszzerdcuokyhcxjuedjielvngarsgxkemvhlzuprywlypxeezaxoqfges"

print(sm.longestPalindrome(testStr))


print(se.longestPalindrome(testStr))











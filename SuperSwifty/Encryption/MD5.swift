//
//  MD5.swift
//  AdaptationKit
//
//  Created by W&Z on 2020/9/5.
//

import Foundation
import CommonCrypto
public extension String {
    /// MD5 编码
    var MD5:String{

        let utf8 = cString(using: .utf8)

        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))

        CC_MD5(utf8, CC_LONG(utf8!.count - 1), &digest)

        return digest.reduce("") { $0 + String(format:"%02X", $1) }.lowercased()
    }
}

public extension Data {

    var MD5:String {

        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))

        let pointer = [UInt8](self)

         CC_MD5(pointer,CC_LONG(count - 1), &digest)
        
        return digest.reduce("") { $0 + String(format:"%02X", $1) }.lowercased()
    }



}

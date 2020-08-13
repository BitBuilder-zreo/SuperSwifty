//
//  RSA.swift
//  Pods-Example
//
//  Created by W&Z on 2020/8/10.
//

import Foundation


extension Data : RSAType {

    public var rsa: RSA {
        
        return RSA(self)
    }
}

//extension String : RSAType {
//
//    public var rsa: RSA {
//
//        return RSA(data(using: .utf8))
//    }
//}



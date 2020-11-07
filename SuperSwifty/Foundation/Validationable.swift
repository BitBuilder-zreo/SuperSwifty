//
//  Valid.swift
//  AdaptationKit
//
//  Created by W&Z on 2020/8/31.
//

import Foundation
import UIKit

/// 可验证协议
public protocol Validationable {

    var validate:Validator { get }

}


extension String : Validationable {
    
    public var validate: Validator {

        return Validator(self)
    }
}


extension UITextField : Validationable {

    public var validate: Validator {

        return Validator(text)
    }
}

public struct Validator {

    let str:String?

    init(_ str:String?) {

        self.str = str
    }

}

extension Validator {

    /// 检测合法性
    /// - Parameter leagl: 合法性
    /// - Returns: 是否合法
    public func legal(_ validate:Validate) -> Bool {

        guard let str = self.str,!str.isEmpty  else { return false }

        return regular(leagl:validate, str: str)
    }

    func regular(leagl:Validate,str:String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", leagl.rawValue)
        return predicate.evaluate(with: str)
    }
}


public enum Validate : String {

    case tel = "^1[3-9]\\d{9}$"
}









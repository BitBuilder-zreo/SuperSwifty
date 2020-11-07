//
//  String.swift
//  AdaptationKit
//
//  Created by W&Z on 2020/9/11.
//

import Foundation

public extension String {

    /// 字符串添加后缀
     /// - Parameter character: 符号
     /// - Returns:
     func suffix(with character:String) -> String {

         guard self != " " else { return self }

         guard !isEmpty else { return self }

         return self + character
     }

     /// 添加前缀
     func prefix(_ character:String) -> String {

         guard self != " " else { return self }

         guard !isEmpty else { return self }

         return character + self
     }
}

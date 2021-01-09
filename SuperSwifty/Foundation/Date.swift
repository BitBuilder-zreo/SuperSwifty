//
//  Date.swift
//  SuperSwifty
//
//  Created by W&Z on 2020/10/16.
//

import Foundation

public struct DateWrapper<Base> {
    let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol DateCompatible {



}

extension DateCompatible {

   public var date:DateWrapper<Self>{

        return DateWrapper(self)
    }
}

extension String : DateCompatible { }

extension Int : DateCompatible { }

extension TimeInterval : DateCompatible { }

extension DateWrapper where Base == String{

    /// 时间戳转 时间格式
    /// - Parameter format: 时间格式
    /// - Returns:
    public func time(format:String = "yyyy-MM-dd HH:mm:ss") -> String? {

        guard let timeValue = TimeInterval(base) else { return nil }

        let formatter = DateFormatter()

        formatter.dateFormat = format

        let date = Date(timeIntervalSince1970:timeValue)

        return formatter.string(from: date)
    }
}

extension DateWrapper where Base == Int {

    /// 时间戳转 时间格式
    /// - Parameter format: 时间格式
    /// - Returns:
    public func time(format:String = "yyyy-MM-dd HH:mm:ss") -> String? {

        let formatter = DateFormatter()

        formatter.dateFormat = format

        let date = Date(timeIntervalSince1970: TimeInterval(base))

        return formatter.string(from: date)
    }

    public func secondsToHoursMinutesSeconds()  -> String {

        return String(format: "%02d:%02d:%02d", base / 3600,(base % 3600) / 60,(base % 3600) % 60)
    }


}




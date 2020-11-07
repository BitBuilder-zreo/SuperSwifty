//
//  Parametersable.swift
//  AdaptationKit
//
//  Created by W&Z on 2020/9/5.
//

import Foundation
public protocol Parametersable {
  func encode() -> [String: Any]
}

//
//  CodableEnumeration.swift
//  Explore
//
//  Created by W&Z on 2020/6/29.
//  Copyright © 2020 W&Z. All rights reserved.
//

import Foundation
import UIKit

public protocol CodableEnumeration : RawRepresentable, Codable where RawValue: Codable {
    
    static var defaultCase: Self { get }
}

extension CodableEnumeration {
    
    public init(from decoder: Decoder) throws {
        
        do {
            let container = try decoder.singleValueContainer()
            
            let decoded = try container.decode(RawValue.self)
            
            self = Self.init(rawValue: decoded) ?? Self.defaultCase
            
        } catch {
            self = Self.defaultCase
        }
    }
}

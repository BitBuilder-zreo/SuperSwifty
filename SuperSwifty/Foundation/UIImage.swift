//
//  UIImage.swift
//  SuperSwifty
//
//  Created by W&Z on 2020/9/23.
//

import Foundation

extension UIImage {

    public convenience init?(named name: String, in anyClass:AnyClass){
        self.init(named:name,in: Bundle(for: anyClass), compatibleWith:nil)
    }

}

//
//  UIStackView.swift
//  AdaptationKit
//
//  Created by W&Z on 2020/9/8.
//

import Foundation
import UIKit

extension UIStackView {

    public func arrangedSubviews<T>() -> [T]? where T : UIView {

        return arrangedSubviews as? [T]
    }

}

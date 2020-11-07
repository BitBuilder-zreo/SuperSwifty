//
//  UITableView.swift
//  AdaptationKit
//
//  Created by W&Z on 2020/9/8.
//

import Foundation
import UIKit

public extension UITableView {


    func dequeueReusableCell<T:UITableViewCell>(for aCalss:T.Type, identifier: String = String(describing: T.self), for indexPath: IndexPath) -> T {

        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
    }


    func dequeueReusableHeaderFooterView<T:UITableViewHeaderFooterView>(for aCalss:T.Type, identifier: String = String(describing: T.self)) -> T? {

        return dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T
    }

}

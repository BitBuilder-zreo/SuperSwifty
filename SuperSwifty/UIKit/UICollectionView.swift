//
//  UICollectionView.swift
//  AdaptationKit
//
//  Created by W&Z on 2020/9/8.
//

import Foundation
import UIKit


public extension UICollectionView {

    func dequeueReusableCell<T:UICollectionViewCell>(for aClass: T.Type, identifier: String = String(describing: T.self), indexPath: IndexPath) -> T {

        return  dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
    }

     func dequeueReusableSupplementaryView<T: UICollectionReusableView>(for aClass: T.Type, kind: String,identifier: String = String(describing: T.self), indexPath: IndexPath) -> T{

        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath) as! T;
    }
}

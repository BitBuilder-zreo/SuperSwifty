//
//  Sequence.swift
//  SuperSwifty
//
//  Created by W&Z on 2020/10/15.
//

import Foundation
extension Array {

    /// 拆分
    /// - Parameter maxSplits: 最大拆分 大小
    /// - Precondition: `maxSplits > 0`
    /// - SeeAlso: `func split(maxSplits: Int) -> [[Self.SubSequence.Element]]`
    ///  ```swift
    ///  [1, 2, 3, 4, 5].maxSplits(2)
    ///
    ///  [[1, 2], [3, 4], [5]]
    /// ```

    public func split(maxSplits:Int) -> [[Element]] {

        return reduce(into: []) { (total, element) in

            guard total.count != 0 else { return total.append([element]) }

            guard (total.last?.count ?? 0) < maxSplits else {
                return total.append([element])
            }

            total.append(total.removeLast() + [element])

        }

    }

}

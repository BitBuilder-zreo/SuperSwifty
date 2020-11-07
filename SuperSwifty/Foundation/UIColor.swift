//
//  UIColor.swift
//  SuperSwifty
//
//  Created by W&Z on 2020/9/23.
//

import Foundation
extension UIColor {

    /// 转换图片
    /// - Parameter size: 大小 默认大小(1,1)
    public   func asImage(_ size: CGSize = CGSize(width: 1.0, height: 1.0)) -> UIImage? {

        var resultImage: UIImage? = nil
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)

        guard let context = UIGraphicsGetCurrentContext() else {

            return resultImage
        }

        context.setFillColor(cgColor)
        context.fill(rect)
        resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return resultImage
    }
}

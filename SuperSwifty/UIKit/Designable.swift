//
//  Designable.swift
//  Pods-Example
//
//  Created by W&Z on 2020/8/27.
//

import Foundation
import UIKit

@IBDesignable
open class IBView : UIView {

    @IBInspectable var cornerRadius : CGFloat {

        set{ layer.cornerRadius = newValue }

        get{ layer.cornerRadius }
    }

    @IBInspectable var maskBounds:Bool {

        set { layer.masksToBounds = newValue }

        get { layer.masksToBounds }
    }

    @IBInspectable var borderColor : UIColor {

        set { layer.borderColor = newValue.cgColor }

        get {
            guard let cg = layer.borderColor else { return UIColor.clear }

            return UIColor(cgColor: cg)
        }
    }

    @IBInspectable var borderWidth : CGFloat {
        set { layer.borderWidth = newValue }
        get { layer.borderWidth }
    }

    @IBInspectable var shadowOffset : CGSize {
        set { layer.shadowOffset = newValue }
        get { layer.shadowOffset }
    }

    @IBInspectable var shadowOpacity:CGFloat {
        set { layer.shadowOpacity = Float(newValue) }
        get { CGFloat(layer.shadowOpacity) }
    }

    @IBInspectable var shadowColor:UIColor {
        set { layer.shadowColor = newValue.cgColor }
        get {
            guard let cg = layer.shadowColor else { return .clear }
            return UIColor(cgColor: cg)
        }
    }

    @IBInspectable var shadowRadius:CGFloat {
        set { layer.shadowRadius = newValue }
        get { layer.shadowRadius }
    }

}

@IBDesignable
open class IBButton:UIButton {
    @IBInspectable var cornerRadius : CGFloat {

        set{ layer.cornerRadius = newValue }

        get{ layer.cornerRadius}
    }

    @IBInspectable var maskBounds:Bool {

        set { layer.masksToBounds = newValue }

        get { layer.masksToBounds }
    }

    @IBInspectable var borderColor : UIColor {

        set { layer.borderColor = newValue.cgColor }

        get {
            guard let cg = layer.borderColor else { return UIColor.clear }

            return UIColor(cgColor: cg)
        }
    }

    @IBInspectable var borderWidth : CGFloat {
        set { layer.borderWidth = newValue }
        get { layer.borderWidth }
    }

    @IBInspectable var shadowOffset : CGSize {
        set { layer.shadowOffset = newValue }
        get { layer.shadowOffset }
    }

    @IBInspectable var shadowOpacity:CGFloat {
        set { layer.shadowOpacity = Float(newValue) }
        get { CGFloat(layer.shadowOpacity) }
    }

    @IBInspectable var shadowColor:UIColor {
        set { layer.shadowColor = newValue.cgColor }
        get {
            guard let cg = layer.shadowColor else { return .clear }
            return UIColor(cgColor: cg)
        }
    }

    @IBInspectable var shadowRadius:CGFloat {
        set { layer.shadowRadius = newValue }
        get { layer.shadowRadius }
    }
}

@IBDesignable
open class IBImageView:UIImageView {
    @IBInspectable var cornerRadius : CGFloat {

        set{ layer.cornerRadius = newValue }

        get{ layer.cornerRadius}
    }

    @IBInspectable var maskBounds:Bool {

        set { layer.masksToBounds = newValue }

        get { layer.masksToBounds }
    }

    @IBInspectable var borderColor : UIColor {

        set { layer.borderColor = newValue.cgColor }

        get {
            guard let cg = layer.borderColor else { return UIColor.clear }

            return UIColor(cgColor: cg)
        }
    }

    @IBInspectable var borderWidth : CGFloat {
        set { layer.borderWidth = newValue }
        get { layer.borderWidth }
    }

    @IBInspectable var shadowOffset : CGSize {
        set { layer.shadowOffset = newValue }
        get { layer.shadowOffset }
    }

    @IBInspectable var shadowOpacity:CGFloat {
        set { layer.shadowOpacity = Float(newValue) }
        get { CGFloat(layer.shadowOpacity) }
    }

    @IBInspectable var shadowColor:UIColor {
        set { layer.shadowColor = newValue.cgColor }
        get {
            guard let cg = layer.shadowColor else { return .clear }
            return UIColor(cgColor: cg)
        }
    }
    @IBInspectable var shadowRadius:CGFloat {
        set { layer.shadowRadius = newValue }
        get { layer.shadowRadius }
    }
}

@IBDesignable
open class IBLabel:UILabel {

    @IBInspectable var cornerRadius : CGFloat {

        set{ layer.cornerRadius = newValue }

        get{ return layer.cornerRadius }
    }

    @IBInspectable var maskBounds:Bool {

        set { layer.masksToBounds = newValue }

        get { return layer.masksToBounds }
    }

    @IBInspectable var borderColor : UIColor {

        set { layer.borderColor = newValue.cgColor }

        get {
            guard let cg = layer.borderColor else { return UIColor.clear }

            return UIColor(cgColor: cg)
        }
    }

    @IBInspectable var borderWidth : CGFloat {
        set { layer.borderWidth = newValue }

        get { layer.borderWidth }
    }
    

}


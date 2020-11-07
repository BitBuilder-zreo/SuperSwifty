//
//  AnimatorType.swift
//  Animator
//
//  Created by W&Z on 2019/8/1.
//  Copyright © 2019 W&Z. All rights reserved.
//

import Foundation
import UIKit

extension Animator {
    
    
    /// 模态视图下而上
    ///
    /// - Parameter transitionContext: 上下文
    public static func appearModalViewControllerAnimated(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toView = transitionContext.view(forKey: .to) else {
            
            return transitionContext.completeTransition(false)
        }
        
        toView.frame = CGRect(
            x:0,
            y: toView.bounds.height,
            width: toView.bounds.width,
            height: toView.bounds.height
        )
        
        transitionContext.containerView.addSubview(toView)
        
        UIView.animate(withDuration: 0.35, animations: {
            toView.frame = transitionContext.containerView.bounds
        }) { (_) in
            
            guard transitionContext.transitionWasCancelled else {
                
                return transitionContext.completeTransition(true)
            }
            
            toView.removeFromSuperview()
            
            transitionContext.completeTransition(false)
        }
        
        
    }
    
    /// 模态视图上而下
    ///
    /// - Parameter transitionContext: 上下文
    public static func disappearModalViewControllerAnimated(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.view(forKey: .from) else {
            
            return transitionContext.completeTransition(false)
        }
        
        guard let toView = transitionContext.view(forKey: .to) else {
            
            return transitionContext.completeTransition(false)
        }
        transitionContext.containerView.addSubview(toView)
        transitionContext.containerView.addSubview(fromView)
        
        UIView.animate(withDuration: 0.35, animations: {
            
            fromView.frame = CGRect(
                x: 0,
                y: fromView.bounds.height,
                width: fromView.bounds.width,
                height: fromView.bounds.height
            )
            
        }) { (finished) in
            
            guard transitionContext.transitionWasCancelled  else {
                fromView.removeFromSuperview()
                
                return transitionContext.completeTransition(true)
            }
           
            toView.removeFromSuperview()
            transitionContext.completeTransition(false)
        }
    }
}


public extension Animator {
    
    /// 放大
    ///
    /// - Parameter transitionContext: 上下文
    static func zoom(using transitionContext: UIViewControllerContextTransitioning){
        
        guard let toView = transitionContext.view(forKey: .to) else {
            
            return transitionContext.completeTransition(true)
        }
        
        transitionContext.containerView.addSubview(toView)
        
        toView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        
        toView.alpha = 0.0
        
        UIView.animate(withDuration: 0.35, animations: {
            toView.transform = CGAffineTransform.identity
            toView.alpha = 1.0
        }) { (_) in
            
            guard transitionContext.transitionWasCancelled else {

                return transitionContext.completeTransition(true)
            }
            toView.removeFromSuperview()

            transitionContext.completeTransition(true)
        }
    }
    
    /// 缩小
    ///
    /// - Parameter transitionContext: 上下文
    static func lessen(using transitionContext: UIViewControllerContextTransitioning){
        
        guard let fromView = transitionContext.view(forKey: .from) else {
            
            return transitionContext.completeTransition(true)
        }
        UIView.animate(withDuration: 0.35, animations: {
            
            fromView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            fromView.alpha = 0.0
        }) { (finished) in
            
            guard transitionContext.transitionWasCancelled  else {
                fromView.removeFromSuperview()
                return transitionContext.completeTransition(true)
            }
            
        }
    }
    
}

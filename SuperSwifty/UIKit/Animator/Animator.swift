//
//  Animator.swift
//  Animator
//
//  Created by W&Z on 2019/7/28.
//  Copyright © 2019 W&Z. All rights reserved.
//

import Foundation
import UIKit


/// 过渡类型
///
/// - appear: 出现
/// - disappear: 消失
public enum TransitioningType{
    /// 出现
    case appear
    /// 消失
    case disappear
}


public typealias Transitioning = (UIViewControllerContextTransitioning) ->()

public class Animator : NSObject {
    
    /// 动画时长
    let duration : TimeInterval
    
    var transiting:Transitioning
    
    
    public init(_ duration:TimeInterval = 0.35,
               transiting:@escaping Transitioning){
        
        self.duration = duration
        
        self.transiting = transiting
    }
    
}


extension Animator : UIViewControllerAnimatedTransitioning{
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    
        return duration
    }
    
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
          transiting(transitionContext)
    }
    
}






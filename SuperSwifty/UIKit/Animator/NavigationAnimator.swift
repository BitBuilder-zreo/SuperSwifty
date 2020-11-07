//
//  NavigationAnimator.swift
//  Animator
//
//  Created by W&Z on 2019/8/1.
//  Copyright © 2019 W&Z. All rights reserved.
//

import Foundation
import UIKit

public protocol NavigationAnimator : NSObjectProtocol {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?
    
}

extension NavigationAnimator {
    
    public   func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        
        return nil
    }
    
    public  func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?{
        
        return nil
    }
    
}


extension UINavigationController : UINavigationControllerDelegate {
    
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        switch operation {
        case .push:
            
            let animator = navigationAnimator(toVC)
            
            return animator?.navigationController(navigationController, animationControllerFor: operation, from: fromVC, to: toVC)
        case .pop :
            
            let animator = navigationAnimator(fromVC)
            
            return animator?.navigationController(navigationController, animationControllerFor: operation, from: fromVC, to: toVC)
        default:
            return nil
        }
        
        
    }
    
    public func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        guard let animator = navigationController.viewControllers.last as? NavigationAnimator else { return nil }
        
        return animator.navigationController(navigationController, interactionControllerFor: animationController)
    }
}

extension UINavigationController {
    
    func navigationAnimator(_ vc : UIViewController) -> NavigationAnimator? {
        
        guard let animator = vc as? NavigationAnimator else { return nil }
        
        return animator
    }
}

extension UINavigationController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self

    }
    
}


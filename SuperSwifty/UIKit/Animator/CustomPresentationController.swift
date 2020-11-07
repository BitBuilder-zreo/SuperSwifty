//
//  AnimatorViewController.swift
//  Animator
//
//  Created by W&Z on 2019/7/28.
//  Copyright © 2019 W&Z. All rights reserved.
//

import UIKit

public class CustomPresentationController: UIPresentationController {
    
    public typealias LoadViewCompletion = (UIView)->()
    
    let completion:LoadViewCompletion?
    
    
    
    public  init(presentedViewController: UIViewController,presenting presentingViewController: UIViewController?,_ loadCompletion:LoadViewCompletion? = nil) {
        self.completion = loadCompletion
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    public lazy var maskView : UIView? = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.7725490196, green: 0.7725490196, blue: 0.7725490196, alpha: 0.5)
        view.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(dimmingViewTapped))
        )
        
        if let container = self.containerView {
            
            container.addSubview(view)
            
            let h = NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-0-[view]-0-|",
                metrics:nil,
                views: ["view":view]
            )
            
            let v = NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-0-[view]-0-|",
                metrics:nil,
                views: ["view":view]
            )
            
            container.addConstraints(h)
            container.addConstraints(v)
            
        }
        
        return view
    }()
    
    
    public override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        if let view = self.maskView , view.superview == nil{
            containerView?.addSubview(view)
            
            
            let h = NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-0-[view]-0-|",
                metrics:nil,
                views: ["view":view]
            )
            
            let v = NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-0-[view]-0-|",
                metrics:nil,
                views: ["view":view]
            )
            
            containerView?.addConstraints(h)
            containerView?.addConstraints(v)
        }

        maskView?.alpha = 0.0
        
        if let presentedView = self.presentedView {
            containerView?.addSubview(presentedView)
            completion?(presentedView)
        }
        
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: {[weak self] (context) in
            
            self?.maskView?.alpha = 1.0
            
            }, completion:nil)
        
    }
    
    public override func presentationTransitionDidEnd(_ completed: Bool) {
        super.presentationTransitionDidEnd(completed)
        
        if completed == false {
            self.maskView = nil
        }
    }
    
    public override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        
        maskView?.alpha = 1.0
        
        presentingViewController.transitionCoordinator?.animate(alongsideTransition: { [weak self](context) in
            
            self?.maskView?.alpha = 0.0
            
            }, completion: nil)
    }
    
    public override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            maskView?.removeFromSuperview()
            maskView = nil
        }
    }
    
    @objc func dimmingViewTapped(){
        
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
    
}

//
//  UnfoldGraduallyAnimator.swift
//  ASTTransition
//
//  Created by ShevaKuilin on 2020/11/2.
//  Copyright © 2020 ShevaKuilin. All rights reserved.
//

import UIKit

class UnfoldGraduallyAnimator: NSObject {
    public var startRect: CGRect = .zero
    public var subLayouts: (CGRect, CGRect, CGRect)!
}

extension UnfoldGraduallyAnimator: UIViewControllerAnimatedTransitioning {
    /// - Note: Duration of animation
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    /// - Note: Content of the animation
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: .from)
        let toViewController = transitionContext.viewController(forKey: .to)
        let containerView = transitionContext.containerView
        var toView = fromViewController?.view
        /// Add animation effects
        if transitionContext.responds(to: #selector(UIViewControllerTransitionCoordinatorContext.view(forKey:))) {
            toView = transitionContext.view(forKey: .to)
        }
        toView?.frame = startRect
        /// Add toView
        if let to = toView {
            containerView.addSubview(to)
            
            let headImageView = huntSubViews(to, 1001)
            headImageView?.frame = [0, 0, startRect.width, startRect.height].frame
            let textLabel = huntSubViews(to, 1002)
            textLabel?.isHidden = true
            let subTitleLabel = huntSubViews(to, 1003)
            subTitleLabel?.frame = subLayouts.0
            let mainTitleLabel = huntSubViews(to, 1004)
            mainTitleLabel?.frame = subLayouts.1
            let contentTitleLabel = huntSubViews(to, 1005)
            contentTitleLabel?.frame = subLayouts.2
            
            /// Set cornerRadius
            to.layer.masksToBounds = true
            to.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
            to.layer.cornerRadius = 15
            let duration = self.transitionDuration(using: transitionContext)
            UIView.animate(withDuration: duration, animations: {
                if let toVC = toViewController {
                    to.frame = transitionContext.finalFrame(for: toVC)
                    to.layer.cornerRadius = 1
                    headImageView?.frame = [0, 0, to.bounds.width, UIScreen.main.bounds.size.height/2].frame
                    textLabel?.frame = [0, UIScreen.main.bounds.size.height/2 + 100, to.bounds.width, 25].frame
                    subTitleLabel?.frame = [20, 20, UIScreen.main.bounds.size.width - 140, 15].frame
                    mainTitleLabel?.frame = [20, 50, UIScreen.main.bounds.size.width - 140, 60].frame
                    contentTitleLabel?.frame = [20, UIScreen.main.bounds.size.height/2 - 10, UIScreen.main.bounds.size.width - 140, 18].frame
                }
            }) { _ in
                textLabel?.isHidden = false
                /// complete transition
                let wasCancelled = transitionContext.transitionWasCancelled
                transitionContext.completeTransition(!wasCancelled)
            }
        }
    }
}

private extension UnfoldGraduallyAnimator {
    func huntSubViews(_ superView: UIView, _ viewTag: Int) -> UIView? {
        var resultView: UIView?
        for subView in superView.subviews {
            if subView.tag == viewTag {
                resultView = subView
                break
            }
        }
        return resultView
    }
}

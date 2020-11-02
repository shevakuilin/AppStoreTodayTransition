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

}

extension UnfoldGraduallyAnimator: UIViewControllerAnimatedTransitioning {
    /// - Note: Duration of animation
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
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
            var headImageView: UIImageView?
            for subView in to.subviews {
                if subView.isKind(of: UIImageView.classForCoder()) {
                    subView.frame = [0, 0, startRect.width, startRect.height].frame
                    headImageView = subView as? UIImageView
                    break
                }
            }
            containerView.addSubview(to)
            let duration = self.transitionDuration(using: transitionContext)
            UIView.animate(withDuration: duration, animations: {
                if let toVC = toViewController {
                    to.frame = transitionContext.finalFrame(for: toVC)
                    headImageView?.frame = [0, 0, to.bounds.width, 500].frame
                }
            }) { _ in
                let wasCancelled = transitionContext.transitionWasCancelled
                transitionContext.completeTransition(!wasCancelled)
            }
        }
    }
}

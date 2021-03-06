//
//  ViewController.swift
//  ASTTransition
//
//  Created by ShevaKuilin on 2020/11/2.
//  Copyright © 2020 ShevaKuilin. All rights reserved.
//

import UIKit

private struct F {
    var x: CGFloat
    var y: CGFloat
    var width: CGFloat
    var height: CGFloat
}

class ViewController: UIViewController {
    private lazy var nextVC = NestViewController()
//    private var transitionDelegate: CustomPresentationController?
    
    private lazy var cardView = UIImageView()
    private lazy var subTitleLabel = UILabel()
    private lazy var mainTitleLabel = UILabel()
    private lazy var contentTitleLabel = UILabel()
    
    private var f = F(x: 20, y: 150, width: UIScreen.main.bounds.size.width - 40, height: UIScreen.main.bounds.size.height - 500)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray5
        initCard()
        setTransitionDelegate()
    }
}

private extension ViewController {
    func initCard() {
        cardView.contentMode = .scaleAspectFill
        cardView.image = ["genshin"].image
        cardView.frame = [f.x, f.y, f.width, f.height].frame
        cardView.layer.masksToBounds = true
        cardView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        cardView.layer.cornerRadius = 15
        cardView.isUserInteractionEnabled = true
        self.view.addSubview(cardView)
        
        /// sub title
        subTitleLabel.frame = [20, 20, f.width - 100, 15].frame
        subTitleLabel.font = [13].font
        subTitleLabel.textColor = .white
        subTitleLabel.alpha = 0.4
        subTitleLabel.text = "对话创作者"
        cardView.addSubview(subTitleLabel)
        
        /// main title
        mainTitleLabel.frame = [20, 50, f.width - 100, 60].frame
        mainTitleLabel.font = [22].boldFont
        mainTitleLabel.textColor = .white
        mainTitleLabel.text = "黄玲：拍视频就是边玩边交朋友"
        mainTitleLabel.numberOfLines = 0
        cardView.addSubview(mainTitleLabel)
        
        /// content title
        contentTitleLabel.frame = [20, f.height - 40, f.width - 100, 18].frame
        contentTitleLabel.font = [14].font
        contentTitleLabel.textColor = .white
        contentTitleLabel.text = "她的粉丝都是 App 里的朋友"
        cardView.addSubview(contentTitleLabel)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        tap.delegate = self
        cardView.addGestureRecognizer(tap)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
        cardView.addGestureRecognizer(longPress)
    }
    
    func setTransitionDelegate() {
//        transitionDelegate = CustomPresentationController(presentedViewController: nextVC, presenting: self)
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.transitioningDelegate = self
        nextVC.headImage = cardView.image
    }
}

private extension ViewController {
    @objc func tapAction() {
        // - Todo: 缩放 + 转场触发
        print("触发单击手势")
        guard self.cardView.bounds.size.width == f.width else { return }
        UIView.animate(withDuration: 0.3, animations: {
            self.cardView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            self.present(self.nextVC, animated: true) {
                self.cardView.transform = CGAffineTransform.identity
            }
        }
    }
    
    @objc func longPress(_ recognizer: UILongPressGestureRecognizer) {
        if recognizer.state == .began {
            // - Todo: 长按：缩放
            print("长按开始")
            guard self.cardView.bounds.size.width == f.width else { return }
            UIView.animate(withDuration: 0.3) {
                self.cardView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }
        } else if recognizer.state == .ended {
            // - Todo: 松手：转场
            print("长按松手")
            self.present(self.nextVC, animated: true) {
                self.cardView.transform = CGAffineTransform.identity
            }
        }
    }
}

private extension ViewController {
    func scale(_ frame: CGRect, _ scale: CGFloat) -> CGRect {
        let size = frame.size
        return [frame.origin.x, frame.origin.y, size.width * scale, size.height * scale].frame
    }
}

// MARK: UIGestureRecognizerDelegate
extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
}

// MARK: UIViewControllerTransitioningDelegate
extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animator = UnfoldGraduallyAnimator()
        animator.startRect = cardView.frame
        animator.subLayouts = (scale(subTitleLabel.frame, 0.95), scale(mainTitleLabel.frame, 0.95), scale(contentTitleLabel.frame, 0.95))
        return animator
    }

//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return UnfoldGraduallyAnimator()
//    }
}


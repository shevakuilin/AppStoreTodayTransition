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
    private lazy var cardView = UIImageView()
    
    private var f = F(x: 20, y: 200, width: UIScreen.main.bounds.size.width - 40, height: UIScreen.main.bounds.size.height - 400)

    override func viewDidLoad() {
        super.viewDidLoad()
        initCard()
    }
}

private extension ViewController {
    func initCard() {
        cardView.contentMode = .scaleToFill
        cardView.image = ["genshin"].image
        cardView.frame = [f.x, f.y, f.width, f.height].frame
        cardView.layer.masksToBounds = true
        cardView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        cardView.layer.cornerRadius = 20
        cardView.isUserInteractionEnabled = true
        self.view.addSubview(cardView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        tap.delegate = self
        cardView.addGestureRecognizer(tap)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
        cardView.addGestureRecognizer(longPress)
    }
}

private extension ViewController {
    @objc func tapAction() {
        // - Todo: 缩放 + 转场触发
        print("触发单击手势")
        guard self.cardView.bounds.size.width == f.width else { return }
        UIView.animate(withDuration: 0.3) {
            self.cardView.bounds.size.width -= 20
            self.cardView.bounds.size.height -= 20
        }
    }
    
    @objc func longPress(_ recognizer: UILongPressGestureRecognizer) {
        if recognizer.state == .began {
            // - Todo: 长按：缩放
            print("长按开始")
            guard self.cardView.bounds.size.width == f.width else { return }
            UIView.animate(withDuration: 0.3) {
                self.cardView.bounds.size.width -= 20
                self.cardView.bounds.size.height -= 20
            }
        } else if recognizer.state == .ended {
            // - Todo: 松手：转场
            print("长按松手")
        }
    }
}

// MARK: UIGestureRecognizerDelegate

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
}


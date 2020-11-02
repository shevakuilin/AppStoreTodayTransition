//
//  NestViewController.swift
//  ASTTransition
//
//  Created by ShevaKuilin on 2020/11/2.
//  Copyright © 2020 ShevaKuilin. All rights reserved.
//

import UIKit

class NestViewController: UIViewController {
    public var headImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("进入NextVC")
        initElements()
    }
}

private extension NestViewController {
    func initElements() {
        self.view.backgroundColor = [255, 64, 63].color
        self.view.layer.masksToBounds = true
        self.view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        self.view.layer.cornerRadius = 20
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(back))
        self.view.addGestureRecognizer(tap)
        
        let headImageView = UIImageView()
        headImageView.image = headImage
        headImageView.contentMode = .center
//        headImageView.frame = [0, 0, self.view.bounds.width, 500].frame
        self.view.addSubview(headImageView)
    }
}

private extension NestViewController {
    @objc func back() {
        self.dismiss(animated: true, completion: nil)
    }
}

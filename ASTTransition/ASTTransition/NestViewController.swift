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
    private var textLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("进入NextVC")
        initElements()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.textLabel.isHidden = false
    }
}

private extension NestViewController {
    func initElements() {
        self.view.backgroundColor = [245, 119, 159].color
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
        
        textLabel = UILabel()
        textLabel.font = UIFont.systemFont(ofSize: 20)
        textLabel.textColor = .white
        textLabel.text = "哔哩哔哩(゜-゜)つロ干杯~-bilibili"
        textLabel.textAlignment = .center
        textLabel.frame = [0, self.view.bounds.height - 100, self.view.bounds.width, 25].frame
        self.view.addSubview(textLabel)
        textLabel.isHidden = true
    }
}

private extension NestViewController {
    @objc func back() {
        self.dismiss(animated: true, completion: nil)
    }
}

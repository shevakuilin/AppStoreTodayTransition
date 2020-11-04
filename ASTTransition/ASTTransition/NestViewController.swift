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

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
}

private extension NestViewController {
    func initElements() {
        self.view.backgroundColor = [245, 119, 159].color
                
        let tap = UITapGestureRecognizer(target: self, action: #selector(back))
        self.view.addGestureRecognizer(tap)
        
        let headImageView = UIImageView()
        headImageView.tag = 1001
        headImageView.image = headImage
        headImageView.contentMode = .scaleAspectFill
        self.view.addSubview(headImageView)
        
        textLabel = UILabel()
        textLabel.tag = 1002
        textLabel.font = UIFont.systemFont(ofSize: 20)
        textLabel.textColor = .white
        textLabel.text = "哔哩哔哩(゜-゜)つロ干杯~-bilibili"
        textLabel.textAlignment = .center
        self.view.addSubview(textLabel)
    }
}

private extension NestViewController {
    @objc func back() {
        self.dismiss(animated: true, completion: nil)
    }
}

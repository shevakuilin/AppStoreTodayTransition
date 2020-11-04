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
        self.view.backgroundColor = .white
                
        let tap = UITapGestureRecognizer(target: self, action: #selector(back))
        self.view.addGestureRecognizer(tap)
        
        /// head image
        let headImageView = UIImageView()
        headImageView.tag = 1001
        headImageView.image = headImage
        headImageView.contentMode = .scaleAspectFill
        self.view.addSubview(headImageView)
        
        /// bottom content
        textLabel = UILabel()
        textLabel.tag = 1002
        textLabel.font = [18].font
        textLabel.textColor = .systemGray
        textLabel.text = "哔哩哔哩(゜-゜)つロ干杯~-bilibili"
        textLabel.textAlignment = .center
        self.view.addSubview(textLabel)
        
        /// sub title
        let subTitleLabel = UILabel()
        subTitleLabel.tag = 1003
        subTitleLabel.font = [13].font
        subTitleLabel.textColor = .white
        subTitleLabel.alpha = 0.4
        subTitleLabel.text = "对话创作者"
        self.view.addSubview(subTitleLabel)
        
        /// main title
        let mainTitleLabel = UILabel()
        mainTitleLabel.tag = 1004
        mainTitleLabel.font = [22].boldFont
        mainTitleLabel.textColor = .white
        mainTitleLabel.text = "黄玲：拍视频就是边玩边交朋友"
        mainTitleLabel.numberOfLines = 0
        self.view.addSubview(mainTitleLabel)
        
        /// content title
        let contentTitle = UILabel()
        contentTitle.tag = 1005
        contentTitle.font = [14].font
        contentTitle.textColor = .white
        contentTitle.text = "她的粉丝都是 App 里的朋友"
        self.view.addSubview(contentTitle)
    }
}

private extension NestViewController {
    @objc func back() {
        self.dismiss(animated: true, completion: nil)
    }
}

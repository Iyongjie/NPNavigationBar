//
//  NPBaseViewController.swift
//  Demo
//
//  Created by 李永杰 on 2020/5/11.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit
import SnapKit

class NPBaseViewController: UIViewController, NPNavigationBarDelegate {
    
    var navigationBar: NPNavigtionBar?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    func addNavigationBar() {
        navigationBar = NPNavigtionBar.npNavigtionBar()
        navigationBar!.setBackgroundColor(backgroundColor: .white)
        navigationBar!.delegate = self
        navigationBar?.setItem(tag: 423, title: "返回", titleColor: .red, backgroundColor: .white, font: UIFont.systemFont(ofSize: 20), radius: 0, state: .normal)
        self.view.addSubview(navigationBar!)
    }
    
    func didClickNavigationWithTag(tag: NSInteger) {
        if tag == 423 {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationBar!.snp.remakeConstraints { (make) in
            make.left.top.equalTo(0)
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(kNPNavigationBarHeight)
        }
    }
}

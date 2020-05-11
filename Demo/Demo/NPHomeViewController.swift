//
//  NPHomeViewController.swift
//  Demo
//
//  Created by 李永杰 on 2020/5/11.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit

class NPHomeViewController: NPBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI() {
        addNavigationBar()
        navigationBar!.title = "首页"
        navigationBar?.style = .leftAndMiddle
        navigationBar?.setBackgroundImageName(name: "bridge.jpg")
    }
}

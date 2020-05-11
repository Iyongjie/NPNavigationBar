//
//  ViewController.swift
//  Demo
//
//  Created by 李永杰 on 2020/5/11.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, NPNavigationDataSource, NPNavigationBarDelegate {
    
    func didClickNavigationWithTag(tag: NSInteger) {
        if tag == 424 {
            let homeVC = NPHomeViewController()
            self.navigationController?.pushViewController(homeVC, animated: true)
        } else if tag == 523 {
            let searchVC = NPSearchViewController()
            self.navigationController?.pushViewController(searchVC, animated: true)
        }
    }
    
    func createNavigationView() -> UIView {
        let view = UIView()
        view.backgroundColor = .cyan
        return view
    }
    
    var locationBtn: UIButton!
    var navigationBar: NPNavigtionBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
        navigationBar = NPNavigtionBar.npNavigtionBar()
        let messageBtn = UIButton(type: .custom)
        messageBtn.setTitle("消息", for: .normal)
        messageBtn.setTitleColor(.black, for: .normal)
        let cartBtn = UIButton(type: .custom)
        cartBtn.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        cartBtn.setTitle("我的购物车", for: .normal)
        cartBtn.setTitleColor(.black, for: .normal)
        navigationBar!.rightItems = [messageBtn, cartBtn]
        self.view.addSubview(navigationBar!)
        
        locationBtn = UIButton(type: .custom)
        locationBtn.setTitle("定位", for: .normal)
        locationBtn.setTitleColor(.black, for: .normal)
        navigationBar!.addItemWithPosition(position: .left, item: locationBtn)

        let titleView = UIView()
        titleView.backgroundColor = .yellow
        titleView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        navigationBar!.addHeaderView(view: titleView)
        navigationBar?.title = "demo"
        navigationBar!.setItem(tag: 524, title: "添加我的", titleColor: .red, backgroundColor: .brown, font: UIFont.systemFont(ofSize: 13), radius: 2, state: .normal)
        navigationBar!.setItem(tag: 423, imageName: "star.jpg", edgInset: UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12), state: .normal)
        navigationBar?.setBackgroundColor(backgroundColor: .lightGray)
//        navigationBar?.dataSource = self
        
        navigationBar?.delegate = self
        // 动态改变
        locationText()
    }
    func locationText() {
        let time: TimeInterval = 2.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            
            let width = (self.navigationBar?.calculateWidthWithFont(string: "呼和浩特"))!
            
            self.locationBtn.frame = CGRect(x: 0, y: 0, width: width, height: 0)
            self.navigationBar?.setItem(tag: 424, title: "呼和浩特", titleColor: .red, backgroundColor: .yellow, font: UIFont.systemFont(ofSize: 15), radius: 3, state: .normal)
            
            let myBtn = UIButton(type: .custom)
            myBtn.setTitle("我", for: .normal)
            myBtn.setTitleColor(.black, for: .normal)
            self.navigationBar!.addItemWithPosition(position: .left, item: myBtn)
            self.navigationBar?.layoutSubviews()
        }
//        let text = ["郑州", "呼和浩特", "乌鲁木齐", "澳门行政区", "香港自治区"]
//        // 定时时间
//        var timeCount = 60
//        // 创建时间源
//        let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
//        // 每秒调用一次
//        timer.schedule(deadline: .now(), repeating: .seconds(1))
//        timer.setEventHandler {
//            timeCount -= 1
//            if timeCount <= 0 { timer.cancel() }
//            DispatchQueue.main.async {
//                let title = text[Int(arc4random())%5]
//
//                let width = (self.navigationBar?.calculateWidthWithFont(string: title))!
//
//                self.locationBtn.frame = CGRect(x: 0, y: 0, width: width, height: 0)
//                self.navigationBar?.setItem(tag: 424, title: title, titleColor: .red, backgroundColor: .yellow, font: UIFont.systemFont(ofSize: 15), radius: 3, state: .normal)
//                self.navigationBar?.layoutSubviews()
//
//            }
//        }
//        // 启动时间源
//        timer.resume()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
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


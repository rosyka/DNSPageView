//
//  ViewController1.swift
//  Demo
//
//  Created by Daniels on 2018/2/24.
//  Copyright © 2018 Daniels. All rights reserved.
//

import UIKit
import DNSPageView

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11, *) {
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }

        // 创建DNSPageStyle，设置样式
        let style = DNSPageStyle()
        style.isTitleViewScrollEnabled = true
        style.isTitleScaleEnabled = true

        // 设置标题内容
        let titles = ["头条", "视频", "娱乐", "要问", "体育" , "科技" , "汽车" , "时尚" , "图片" , "游戏" , "房产"]

        // 创建每一页对应的controller
        for i in 0..<titles.count {
            let controller = ContentViewController()
            controller.view.backgroundColor = UIColor.randomColor
            controller.index = i
            addChild(controller)
        }

        let y = UIApplication.shared.statusBarFrame.height + (navigationController?.navigationBar.frame.height ?? 0)
        let size = UIScreen.main.bounds.size

        // 创建对应的DNSPageView，并设置它的frame
        let pageView = DNSPageView(frame: CGRect(x: 0, y: y, width: size.width, height: size.height), style: style, titles: titles, childViewControllers: children)
        view.addSubview(pageView)
    }

}


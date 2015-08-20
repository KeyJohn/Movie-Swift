//
//  MainTabBarController.swift
//  Movie
//
//  Created by keyzhang on 15/8/19.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    var selectedImgView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.createTabbar()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.createTabbar()
    }
    
    func createTabbar() {
        //设置tabbar的背景
        self.tabBar.backgroundImage = UIImage(named: "tab_bg_all.png")
        
        //打印子视图
//        print(self.tabBar.subviews)
        
        //注意：UITabBarButton是一个私有的API
        //遍历tabbar中所有的子视图，并且移除按钮
        for view: UIView in self.tabBar.subviews {
            let cls: AnyClass! = NSClassFromString("UITabBarButton")
            if view.isKindOfClass(cls) {
                //移除tabbar上的按钮
                view.removeFromSuperview()
            }
            
        }
        
        //创建自己的图片
        //创建选择图片
        selectedImgView = UIImageView(image: UIImage(named: "selectTabbar_bg_all1"))
        selectedImgView.frame = CGRect(x: 0, y: 0, width: 49, height: 49)
        self.tabBar.addSubview(selectedImgView)
        
        //创建按钮
        let imgArr = ["movie_home.png", "msg_new.png", "start_top250.png", "icon_cinema.png", "more_setting.png"]
        let titleArr = ["电影", "新闻", "top", "影院", "更多"]

        let width = kScreenWidth / CGFloat(imgArr.count)
        let height = self.tabBar.height
        
        for index in 0...4 {
            let imgName = imgArr[index]
            let title = titleArr[index]
            
//            let btn = UIButton(type: UIButtonType.Custom)
//            btn.tag = 2015 + index
//            btn.frame = CGRectMake(width * CGFloat(index), 0, width, height)
//            btn.addTarget(self, action: "clickItem:", forControlEvents: UIControlEvents.TouchUpInside)
////            btn.setBackgroundImage(UIImage(named: imgName), forState: UIControlState.Normal)
//            btn.setImage(UIImage(named: imgName), forState: UIControlState.Normal)
//            btn.setTitle(title, forState: UIControlState.Normal)
//            btn.titleLabel?.font = UIFont.systemFontOfSize(11)
//            btn.titleEdgeInsets = UIEdgeInsets(top: 30, left: -20, bottom: 0, right: 0)
//            btn.imageEdgeInsets = UIEdgeInsets(top: -10, left: 20, bottom: 0, right: 0)
//            
//            self.tabBar.addSubview(btn)
            
            let item = TabbarItem(frame: CGRectMake(width * CGFloat(index), 0, width, height), name: imgName, title: title)
            item.tag = 2015 + index
            item.addTarget(self, action: "clickItem:", forControlEvents: UIControlEvents.TouchUpInside)
            self.tabBar.addSubview(item)
            
            
            if index == 0 {
                selectedImgView.center = item.center
            }
            
        }
        

    }
    
    func clickItem(item: TabbarItem) {
        
        self.selectedIndex = item.tag - 2015
        
        //动画
        UIView.animateWithDuration(0.3) { () -> Void in
            self.selectedImgView.center = item.center
        }
        
    }

    

}

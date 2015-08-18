//
//  BaseNavigationController.swift
//  Movie
//
//  Created by keyzhang on 15/8/19.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let naviBgimg = UIImage(named: "nav_bg_all-64.png")
        //设置导航栏背景图片
        self.navigationBar.setBackgroundImage(naviBgimg, forBarMetrics: UIBarMetrics.Default)
        
        //修改导航栏标题的颜色
        self.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(20), NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
    
    //修改状态栏颜色
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

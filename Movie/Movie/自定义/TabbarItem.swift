//
//  TabbarItem.swift
//  Movie
//
//  Created by keyzhang on 15/8/19.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class TabbarItem: UIControl {
    

    init(frame: CGRect, name: String, title: String) {
        
        super.init(frame: frame)
        
        //创建子视图
        let imgView = UIImageView(frame: CGRect(x: (frame.size.width - 20) / 2, y: 5, width: 20, height: 20))
        //设置内容模式
        imgView.contentMode = UIViewContentMode.ScaleAspectFit
        imgView.image = UIImage(named: name)
        self.addSubview(imgView)
        
        //创建标题视图
        let titleLabel = UILabel(frame: CGRect(x: 0, y: imgView.bottom, width: frame.size.width, height: 20))
        titleLabel.text = title
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.font = UIFont.systemFontOfSize(11)
        titleLabel.textColor = UIColor.whiteColor()
        self.addSubview(titleLabel)
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

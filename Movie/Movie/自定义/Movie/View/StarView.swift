//
//  StarView.swift
//  Movie
//
//  Created by keyzhang on 15/8/20.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class StarView: UIView {
    
    var rating: Float!
    
    private var grayView: UIView!
    private var yellowView: UIView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self._initViews()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self._initViews()
    }
    
    func _initViews() {
        
        let yellowImg: UIImage! = UIImage(named: "yellow.png")
        let grayImg: UIImage! = UIImage(named: "gray.png")
        
        //创建灰色的星星
        grayView = UIView(frame: CGRect(x: 0, y: 0, width: grayImg.size.width * 5, height: grayImg.size.height))
        grayView.backgroundColor = UIColor(patternImage: grayImg)
        self.addSubview(grayView)
        
        //创建金色星星视图
        yellowView = UIView(frame: grayView.bounds)
        yellowView.backgroundColor = UIColor(patternImage: yellowImg)
        self.addSubview(yellowView)
        //测试: 一半金色星星覆盖
//        yellowView.width /= 2
        
        self.width = self.height * 5
        
        //计算缩放的倍数
        let scale = self.height / grayImg.size.height
        
        grayView.transform = CGAffineTransformMakeScale(scale, scale)
        yellowView.transform = CGAffineTransformMakeScale(scale, scale)
        
        //星星视图修改了transform以后，坐标会变，需要重新恢复坐标
        grayView.origin = CGPointZero
        yellowView.origin = CGPointZero
        
        //设置自己的背景颜色透明
        self.backgroundColor = UIColor.clearColor()
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        yellowView.width = 0;
        
        if let rating = self.rating {
            yellowView.width = CGFloat(rating) / 10 * grayView.width
        }
        
    }
    
    
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

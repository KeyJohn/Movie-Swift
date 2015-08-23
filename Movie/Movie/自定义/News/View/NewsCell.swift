//
//  NewsCell.swift
//  Movie
//
//  Created by keyzhang on 15/8/22.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBOutlet weak var iconImg: UIImageView!
    
    var _newsModel: NewsModel?
    var newsModel: NewsModel {
        get {
            return _newsModel!
        }
        set {
            _newsModel = newValue
            
            let urlString = self.newsModel.image
            
            self.imgView.sd_setImageWithURL(NSURL(string: urlString!))
            
            
            self.titleLabel.text = self.newsModel.title
            self.summaryLabel.text = self.newsModel.summary
            
            //新闻类型
            let type = self.newsModel.type
            switch type! {
            case 0: //普通新闻
                self.iconImg.hidden = true
                summaryLabel.left = self.titleLabel.left
                summaryLabel.transform = CGAffineTransformMakeTranslation(-25, 0)
            case 1: //图片新闻
                self.iconImg.hidden = false
                self.iconImg.image = UIImage(named: "sctpxw.png")
                summaryLabel.transform = CGAffineTransformIdentity
            case 2: //视频新闻
                self.iconImg.hidden = false
                self.iconImg.image = UIImage(named: "scspxw.png")
                summaryLabel.transform = CGAffineTransformIdentity
            default:
                break
            }

        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

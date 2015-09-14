//
//  TopCell.swift
//  Movie
//
//  Created by keyzhang on 15/9/11.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit



class TopCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var starView: StarView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var movie: Movie!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let dic = self.movie.images {
            let urlStr = dic["medium"]!.string;
            self.imgView.sd_setImageWithURL(NSURL(string: urlStr!))
        }
        
        starView.rating = self.movie.average
        ratingLabel.text = "\(self.movie.average!)"
        titleLabel.text = self.movie.title
        
        starView.setNeedsLayout()

    }
    
    
    
    
    
}

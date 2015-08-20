//
//  MovieCell.swift
//  Movie
//
//  Created by keyzhang on 15/8/19.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    var movie: Movie!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    
    
    override func layoutSubviews() {
        
        if let dic = self.movie.images {
            let urlStr = dic["medium"]!.string;
            self.imgView.sd_setImageWithURL(NSURL(string: urlStr!))
        }
        titleLabel.text = self.movie.title
        ratingLabel.text = "\(self.movie.average!)"
        yearLabel.text = "年份:\(self.movie.year!)"
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    

    

}

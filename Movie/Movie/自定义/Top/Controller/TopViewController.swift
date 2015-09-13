//
//  TopViewController.swift
//  Movie
//
//  Created by keyzhang on 15/8/19.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class TopViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var data:[Movie] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "TOP"
        
        //请求数据
        self._requestData()
        
    }
    
    func _requestData() {
        
        
        let json: JSON = DataService.requestData(top250)
        let array = json["subjects"]
        for subject in array.array! {
            //转换Model
            var movie = Movie()
            movie.title = subject["title"].string
            movie.images = subject["images"].dictionary
            
            
            movie.average = subject["rating"].dictionaryValue["average"]?.float
            
            movie.year = subject["year"].string
            
            //添加数据
            data.append(movie)

        }
        
    }
    
    //MARK: -UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("TopCell", forIndexPath: indexPath) as! TopCell
        
        cell.backgroundColor = UIColor(red: CGFloat(arc4random()) % 10 * 0.1, green: CGFloat(arc4random()) % 10 * 0.1, blue: CGFloat(arc4random()) % 10 * 0.1, alpha: 1)
        
        
        cell.movie = self.data[indexPath.row]
        return cell
    }
    


}

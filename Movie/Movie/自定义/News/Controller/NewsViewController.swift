//
//  NewsViewController.swift
//  Movie
//
//  Created by keyzhang on 15/8/19.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class NewsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    var data:[NewsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "新闻"

        self.tableView.rowHeight = 60
        self.tableView.backgroundColor = UIColor(patternImage: UIImage(named: "bg_main")!)
        
        
        //设置头视图
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 160))
        let imgView = UIImageView(frame: headerView.bounds)
        imgView.tag = 2015
        headerView.addSubview(imgView)
        self.tableView.tableHeaderView = headerView

        //请求数据
        self._requestData()
        
    }
    
    
    func _requestData() {
        let json: JSON = DataService.requestData(news_list)
        
        for dicJson: JSON in json.arrayValue {
            var model = NewsModel()
            let id = dicJson.dictionaryValue["id"]!.intValue
            let type = dicJson.dictionaryValue["type"]!.intValue
            let title = dicJson.dictionaryValue["title"]!.stringValue
            let summary = dicJson.dictionaryValue["summary"]!.stringValue
            let image = dicJson.dictionaryValue["image"]!.stringValue
            model.id = id
            model.type = type
            model.title = title
            model.summary = summary
            model.image = image
            
            data.append(model)
        }
        
        //给头视图的图片赋值
        let imgView = self.tableView.tableHeaderView?.viewWithTag(2015) as! UIImageView
        let model = self.data[0]
        let url = NSURL(string: model.image!)
        imgView.sd_setImageWithURL(url)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: -UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count - 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! NewsCell
        
        let model = self.data[indexPath.row + 1]
        cell.newsModel = model
        
        return cell
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //贯穿tableView的偏移量
        let yOffset = self.tableView.contentOffset.y + 64
        
        if yOffset < 0 {
            //往下滑拉伸
            let imgView = self.tableView.tableHeaderView?.viewWithTag(2015) as! UIImageView
            
            //计算横向拉伸的比例
            let width = kScreenWidth / 160 * (160 - yOffset)
            
            imgView.frame = CGRect(x: (kScreenWidth - width) / 2, y: yOffset, width: width, height: 160 - yOffset)
            
        }
        
    }
    

}

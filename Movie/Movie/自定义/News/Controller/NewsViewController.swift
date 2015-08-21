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
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: -UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! NewsCell
        
        let model = self.data[indexPath.row]
        cell.newsModel = model
        
        return cell
    }
    
    

}

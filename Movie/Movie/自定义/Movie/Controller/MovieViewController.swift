//
//  MovieViewController.swift
//  Movie
//
//  Created by keyzhang on 15/8/19.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class MovieViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var listTableView: UITableView!
    var posterView: UIView!
    
    var data: [Movie]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "首页";
        
        //初始化导航栏上的按钮
        self._loadNavigationItem()
        
        //初始化列表视图
        self._loadTableView()
        
        //初始化海报视图
        self._loadPosterView()
        
        //请求数据
        self._requestData()
        
    }
    
    //MARK: -导航栏
    func _loadNavigationItem() {
        //创建翻转的父视图
        let buttonView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        buttonView.backgroundColor = UIColor.clearColor()
        
        //创建右侧的两个翻转按钮
        let btn1 = UIButton(type: UIButtonType.Custom)
        btn1.tag = 200
        btn1.hidden = false
        btn1.addTarget(self, action: "rightBarClickAction:", forControlEvents: UIControlEvents.TouchUpInside)
        btn1.setBackgroundImage(UIImage(named: "exchange_bg_home.png"), forState: UIControlState.Normal)
        btn1.setImage(UIImage(named: "list_home.png"), forState: UIControlState.Normal)
        btn1.frame = buttonView.bounds
        buttonView.addSubview(btn1)
        
        let btn2 = UIButton(type: UIButtonType.Custom)
        btn2.tag = 201
        btn2.hidden = true
        btn2.addTarget(self, action: "rightBarClickAction:", forControlEvents: UIControlEvents.TouchUpInside)
        btn2.setBackgroundImage(UIImage(named: "exchange_bg_home.png"), forState: UIControlState.Normal)
        btn2.setImage(UIImage(named: "poster_home.png"), forState: UIControlState.Normal)
        btn2.frame = buttonView.bounds
        buttonView.addSubview(btn2)
        
        let rightItem = UIBarButtonItem(customView: buttonView)
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    func rightBarClickAction(btn: UIButton) {
        let buttonView = self.navigationItem.rightBarButtonItem?.customView
        let btn1 = buttonView?.viewWithTag(200) as! UIButton
        let btn2 = buttonView?.viewWithTag(201) as! UIButton
        
        btn1.hidden = !btn1.hidden
        btn2.hidden = !btn2.hidden
        
        posterView.hidden = !posterView.hidden
        listTableView.hidden = !listTableView.hidden
        
        //翻转按钮
        self.flipView(buttonView!, left: btn1.hidden)
        
        //翻转视图
        self.flipView(self.view, left: btn1.hidden)

    }
    
    func flipView(forView: UIView, left flag: Bool) {
        
        let flipDirection = flag ? UIViewAnimationOptions.TransitionFlipFromLeft : UIViewAnimationOptions.TransitionFlipFromRight
        
        //做子视图的切换
        UIView.transitionWithView(forView, duration: 0.5, options: flipDirection, animations: { () -> Void in
            
            }, completion: nil)
    }
    
    //MARK: -初始化海报视图
    func _loadPosterView() {
        posterView = UIView(frame: self.view.bounds)
        posterView.hidden = true
        posterView.backgroundColor = UIColor.redColor()
        self.view.addSubview(posterView)
    }
    
    
    //MARK: -初始化列表视图
    func _loadTableView() {
        listTableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        listTableView.hidden = false
        listTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        listTableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 49, right: 0)
        listTableView.backgroundColor = UIColor(patternImage: UIImage(named: "bg_main.png")!)
        listTableView.delegate = self
        listTableView.dataSource = self
        
        //设置tableView的行高
        listTableView.rowHeight = 120
        self.view.addSubview(listTableView)
        
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
        let identifier = "MovieCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? MovieCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("MovieCell", owner: nil, options: nil).last as? MovieCell
            cell?.selectionStyle = .None
        }
        
        cell!.movie = self.data[indexPath.row]
        
        return cell!
    }
    
    
    //MARK: -请求数据
    func _requestData() {
        
        //初始化数组
        data = Array()
        
        
        let jsonDic = DataService.requestData(us_box)
        let array = jsonDic["subjects"]
        
        for dic in array {
            let subject = dic.1["subject"]
            
            //转换Model
            var movie = Movie()
            movie.title = subject["title"].string
            movie.images = subject["images"].dictionary
            
            
            movie.average = subject["rating"].dictionaryValue["average"]?.float
            
            movie.year = subject["year"].string
            
            //添加数据
            data.append(movie)
        }
        
        //刷新数据
        self.listTableView.reloadData()
        
    }
    
    
}



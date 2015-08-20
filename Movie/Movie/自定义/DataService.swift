//
//  DataService.swift
//  Movie
//
//  Created by keyzhang on 15/8/19.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

/*
DataService: 做数据解析
*/

import UIKit


class DataService: NSObject {
    
    /*
    根据文件名，能够从本地获取json数据并解析
    */
    class func requestData(fileName: String) -> JSON{
        
        if let filePath = NSBundle(forClass:AppDelegate.self).pathForResource(fileName, ofType: "json") {
            let data = NSData(contentsOfFile: filePath)!
            let json = JSON(data:data)
            return json
        }

        
        return JSON.nullJSON

    }
    

}

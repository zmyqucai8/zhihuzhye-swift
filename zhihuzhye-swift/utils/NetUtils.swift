//
//  NetUtils.swift
//  zhihuzhye-swift
//
//  Created by 张梦云 on 2020/4/2.
//  Copyright © 2020 winfree. All rights reserved.
//

import Foundation


class NetUtils: AFHTTPSessionManager {
    
    
    
    static let instance : NetUtils = NetUtils()
        
        
    class func shareManager()->NetUtils
    {
        let baseUrl = NSURL(string: "https://v.juhe.cn")!
        
        let manager = NetUtils(baseURL: baseUrl as URL, sessionConfiguration: URLSessionConfiguration.default)
//        manager.responseSerializer.ac
        return manager
    }
    
    
    
    
    /**
     get请求
     
     - parameter urlString:  请求的url
     - parameter parameters: 请求的参数
     - parameter success:    请求成功回调
     - parameter failure:    请求失败回调
     */
    class func get(urlString:String,parameters:AnyObject?,success:((_ responseObject:AnyObject?) -> Void)?,failure:((_ error:NSError) -> Void)?) -> Void {
    
        NetUtils.shareManager().get(urlString, parameters: parameters, progress: { (Progress) in
            //进度
        }, success: { (task, responseObject) in
            //成功
            //如果responseObject不为空时
                           if responseObject != nil {
                              
                            success!(responseObject as AnyObject?)
                           }
             
        }) { (task, error) in
            //失败
            failure!(error as NSError)
        }
            
            
    
        
    }
    
}

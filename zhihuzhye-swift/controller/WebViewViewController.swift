//
//  WebViewViewController.swift
//  zhihuzhye-swift
//
//  Created by 张梦云 on 2020/4/2.
//  Copyright © 2020 winfree. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController : UIViewController {
    
    var mWebView : WKWebView!

    var urlStr : String!
    var titleStr : String!
    
    init(url:String ,title:String = "无标题") {
         super.init(nibName: nil, bundle: nil)
        self.urlStr = url
        self.titleStr = title

    }

    required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
      
        self.title = titleStr 
        
        mWebView = WKWebView(frame:CGRect(x:0, y:0, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
                    
        self.view.addSubview(mWebView)
               
        
        //设置访问的url
        let url = URL(string: self.urlStr)
               //根据url创建请求
        let urlRequest = URLRequest(url: url!)
               //加载请求
        mWebView.load(urlRequest)
        
    }
    
 

}

//
//  HomeViewController.swift
//  zhihuzhye-swift
//
//  Created by 张梦云 on 2020/4/1.
//  Copyright © 2020 winfree. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
     var tableView:UITableView!
    
    var dataArr:[NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
          self.view.backgroundColor = .red
        
        self.title = "新闻"
    
       
        //创建tableView
        tableView = UITableView(frame:CGRect(x:0, y:0, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
             tableView.delegate = self
             tableView.dataSource = self
             self.view.addSubview(tableView)
        
        loadData()
        
    }
    
    // 每个分区行数（默认分区为一个）
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return dataArr.count
       }
       // 行高
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 60.0
       }
       // cell
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CellIdentifier")
        cell.textLabel?.text = dataArr[indexPath.row]["title"] as! String
        
        cell.textLabel?.numberOfLines = 0 
           return cell
       }
       // cell点击事件处理
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
        print("点击了第",indexPath.row,"行")
        
        let webVC  = WebViewViewController(url: dataArr[indexPath.row]["url"] as! String, title: dataArr[indexPath.row]["title"] as! String)
        
        self.navigationController?.pushViewController(webVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: false)
  
       }
    
    
    func loadData(){
        
             
             let dic = ["key":"0656181eff9766e313f7130f035ec520","type":"top"]
             let url = "/toutiao/index"
             
             
        //请求数据
        NetUtils.get(urlString: url, parameters: dic as AnyObject, success: { (responseObject) in
            print(responseObject)
            
           
            var result = responseObject?["result"] as! NSDictionary
            
            
            self.dataArr =  (result["data"] as! NSArray) as! [NSDictionary]
            
            
            self.tableView.reloadData()
//            for d in data {
//
//               var s =  d as! NSDictionary
//                print(s["title"])
//            }
            
             

            
        }) { (error) in
             print(error)
        }
    }

}

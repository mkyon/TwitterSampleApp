//
//  HomeViewController.swift
//  TwitterSampleApp
//
//  Created by 松本京子 on 2023/05/29.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    
    var twitterDataList: [TwitterDataModel] = []
    
    override func viewDidLoad(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        initTableView()
        
        // Identifierを設定
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        setTwitterData()
    }
    
    // セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func setTwitterData() {
        for i in 1...4 {
            let twitterDataModel = TwitterDataModel(userName: "ユーザー\(i)", tweet: "ツイート本文\(i)ツイート本文\(i)ツイート本文\(i)ツイート本文\(i)ツイート本文\(i)")
            twitterDataList.append(twitterDataModel)
        }
        let twitterDataModel = TwitterDataModel(userName: "ユーザー5", tweet: "ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5")
        twitterDataList.append(twitterDataModel)

    }
    
    func initTableView(){
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableView.automaticDimension
    }
    
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twitterDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let twitterDataModel: TwitterDataModel = twitterDataList[indexPath.row]
        cell.setup(twitterDataModel: twitterDataModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension    // 自動設定
    }
    

    
}

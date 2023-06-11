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
        
        // Identifierを設定
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        setTwitterData()
    }
    
    // セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func setTwitterData() {
        for i in 1...5 {
            let twitterDataModel = TwitterDataModel(userName: "ユーザー\(i)", tweet: "ツイート本文\(i)ツイート本文\(i)ツイート本文\(i)ツイート本文\(i)ツイート本文\(i)")
            twitterDataList.append(twitterDataModel)
        }
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
        cell.textLabel?.text = twitterDataModel.tweet
        cell.detailTextLabel?.text = twitterDataModel.userName
        return cell
    }
    

    
}

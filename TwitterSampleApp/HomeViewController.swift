//
//  HomeViewController.swift
//  TwitterSampleApp
//
//  Created by 松本京子 on 2023/05/29.
//

import Foundation
import UIKit

class HomeViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    
    var twitterDataList: [TwitterDataModel] = []
    
    override func viewDidLoad(){
        tableView.dataSource = self
        tableView.delegate = self
        
        // Identifierを設定
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        setTwitterData()
    }
    
    
    func setTwitterData() {
        for i in 1...4 {
            let twitterDataModel = TwitterDataModel(userName: "ユーザー\(i)", tweet: "ツイート本文\(i)ツイート本文\(i)ツイート本文\(i)ツイート本文\(i)ツイート本文\(i)")
            twitterDataList.append(twitterDataModel)
        }
        let twitterDataModel = TwitterDataModel(userName: "ユーザー5", tweet: "ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5ツイート本文5")
        twitterDataList.append(twitterDataModel)

    }
    
        
    @IBAction func tapAddButton(_ sender: Any) {
        print("新規作成画面に遷移する")
    }
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twitterDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell{
            let twitterDataModel: TwitterDataModel = twitterDataList[indexPath.row]
            cell.setup(twitterDataModel: twitterDataModel)
            return cell
        }
        return UITableViewCell()
    }
    
}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboad = UIStoryboard(name: "Main", bundle: nil)
        let tweetPostViewController = storyboad.instantiateViewController(identifier: "TweetPostViewController") as! TweetPostViewController
        let tweetData = twitterDataList[indexPath.row]
        tweetPostViewController.configure(tweetData: tweetData)
        tableView.deselectRow(at: indexPath, animated: true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "キャンセル", style: .plain, target: nil, action: nil)
        navigationController?.pushViewController(tweetPostViewController, animated: true)
    }
}

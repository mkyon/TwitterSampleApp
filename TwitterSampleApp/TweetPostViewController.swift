//
//  TweetPostViewController.swift
//  TwitterSampleApp
//
//  Created by 松本京子 on 2023/06/16.
//

import UIKit

class TweetPostViewController: UIViewController{
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var userNameLbl: UILabel!
    var userName:String = ""
    var tweetPost:String = ""
    
    override func viewDidLoad(){
        super.viewDidLoad()
        displayData()
        setNavigationBarButton()
    }
    
    func configure(tweetData: TwitterDataModel){
        userName = tweetData.userName
        tweetPost = tweetData.tweet
        print("データは\(userName)と\(tweetPost)です！")
    }
    
    func displayData(){
        userNameLbl.text = userName
        tweetTextView.text = tweetPost
    }
    
    @objc func tapPostButton(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tweetPostViewController = storyboard.instantiateViewController(identifier: "TweetPostViewController") as! TweetPostViewController
        navigationController?.pushViewController(tweetPostViewController, animated: true)
    }
    
    func setNavigationBarButton(){
        let buttonActionSelector: Selector = #selector(tapPostButton)
        let rightBarButton = UIBarButtonItem(title: "投稿する", style: .done, target: self, action: buttonActionSelector)
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
}

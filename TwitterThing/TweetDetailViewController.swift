//
//  TweetDetailViewController.swift
//  TwitterThing
//
//  Created by Antonio Garcia on 10/29/15.
//  Copyright © 2015 Patriarch Inc. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
    
    var selectedTweet: Tweet!
    

    @IBOutlet weak var selectedTweetText: UILabel!
    
    @IBOutlet weak var selectedTweetUserName: UILabel!
    
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(12)
        label.text = "Created by Antonio"
        label.textColor = UIColor.brownColor()
        return label
    }()
    
    class func identifier() -> String {
        return "TweetDetailViewController"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedTweet = self.selectedTweet{
            print(selectedTweet.text)
        }
        selectedTweetText.text = selectedTweet?.text
        selectedTweetUserName.text = selectedTweet?.user?.username
        
        self.setupAppearance()
        self.setupTweetDetailViewController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.detailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.detailLabel)
        
        let centerX = NSLayoutConstraint(item: self.detailLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
        let bottom = NSLayoutConstraint(item: self.detailLabel, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -20.0)
        
        centerX.active = true
        bottom.active = true
    }
    
    func setupAppearance() {
        if self.selectedTweet?.isRetweet != nil {
            if let rqUser = self.selectedTweet?.rqUser {
                self.navigationItem.title = rqUser.username
                return
            }
        }
        
        if let name = selectedTweet.user?.username {
            self.navigationItem.title = name
        }
    }
    
    func setupTweetDetailViewController() {
        self.selectedTweetText.text = self.selectedTweet.isRetweet ? self.selectedTweet.rqText : self.selectedTweet.text
    }

}
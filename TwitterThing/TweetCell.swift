//
//  TweetCell.swift
//  TwitterThing
//
//  Created by Antonio Garcia on 11/1/15.
//  Copyright © 2015 Patriarch Inc. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    var tweet: Tweet? {
        
        didSet {
            
            if let tweet = self.tweet, user = tweet.user, text = self.tweet?.text {
            
                print(self.tweet?.user?.profileImageUrl)
                
                
                self.tweetTextLabel.text = text
                
                if let image = user.image {
                    self.imgView.image = image
                } else {
                    if let url = NSURL(string: user.profileImageUrl) {
                        let downloadQ = dispatch_queue_create("downloadQ", nil)
                        dispatch_async(downloadQ, { () -> Void in
                            let imageData = NSData(contentsOfURL: url)!
                        
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            let image = UIImage(data: imageData)
                            self.imgView.image = image
                            user.image = image
                        })
                        })
                    }
                }
                }
            }
    }

    class func identifier() -> String {
        return "TweetCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
}

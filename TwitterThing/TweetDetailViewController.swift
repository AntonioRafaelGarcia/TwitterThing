//
//  TweetDetailViewController.swift
//  TwitterThing
//
//  Created by Antonio Garcia on 10/29/15.
//  Copyright © 2015 Patriarch Inc. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
    
    var selectedTweet: Tweet?
    

    @IBOutlet weak var selectedTweetText: UILabel!
    
    @IBOutlet weak var selectedTweetUserName: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let selectedTweet = self.selectedTweet{
            print(selectedTweet.text)
        }
        selectedTweetText.text = selectedTweet?.text
        selectedTweetUserName.text = selectedTweet?.user?.username
            

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

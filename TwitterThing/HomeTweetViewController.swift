import UIKit

class HomeTweetViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tweets = [Tweet]()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK - lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getTweets()
        self.getAccount()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK - other methods
    class func identifier() -> String {
        return "HomeVC"
    }
    
    func getTweets() {
        TwitterService.tweetsFromHomeTimeline { (error, tweets) -> () in
            if let error = error {
                print(error)
                return
            }
            
            if let tweets = tweets {
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    self.tweets = tweets
                    self.tableView.reloadData()
                })
            }
        }
    }
    
    func getAccount() {
        LoginService.loginTwitter({ (error, account) -> () in
            if let error = error {
                print(error)
                return
            }
            
            if let account = account {
                TwitterService.sharedService.account = account
                self.authenticateUser()
            }
        })
    }
    
    func authenticateUser() {
        TwitterService.getAuthUser { (error, user) -> () in
        if let error = error {
            print(error)
            return
        }
        
        if let user = user {
            TwitterService.sharedService.user = user
            self.getTweets()
            }
        }
    }
    
    
    //MARK - table methods
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.registerNib(UINib(nibName: "TweetCell", bundle: nil), forCellReuseIdentifier: "TweetCell")
        
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tweets.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //part 1 - dequeue cell
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetCell
        let tweet = self.tweets[indexPath.row]
        cell.tweet = tweet

        
        //part 3 - return cell to table
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("IndividualTweetSegue", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "IndividualTweetSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let tweet = tweets[indexPath.row]
                let detailViewController = segue.destinationViewController as! TweetDetailViewController
                
                detailViewController.selectedTweet = tweet
            }
        }
    }
}
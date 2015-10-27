import UIKit

class HomeTweetViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tweets = [Tweet]()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK - lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getTweets()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK - other methods
    class func identifier() -> String {
        return "HomeVC"
    }
    
    func getTweets() {
        if let tweetJSONFileUrl = NSBundle.mainBundle().URLForResource("tweet", withExtension: "json") {

            print(tweetJSONFileUrl)
            
            if let tweetJSONData = NSData(contentsOfURL: tweetJSONFileUrl) {
                
                print(tweetJSONData)
                
                if let tweets = TweetJSONParser.tweetFromJSONData(tweetJSONData) {
                    
                    print(tweets)
                    
                    self.tweets = tweets
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    //MARK - table methods
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tweets.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //part 1 - dequeue cell
        let cell = tableView.dequeueReusableCellWithIdentifier("tweet", forIndexPath: indexPath)
        
        //part 2 - configure cell
        //cell.textLabel?.text = "\(indexPath.row)"
        let tweet = self.tweets[indexPath.row]
        cell.textLabel?.text = tweet.text
        cell.detailTextLabel?.text = "The tweet id is: \(tweet.id)"
        
        
        //part 3 - return cell to table
        return cell
    }
}
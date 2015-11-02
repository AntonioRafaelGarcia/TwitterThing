import Foundation

class TweetJSONParser {
    
    class func tweetFromJSONData(json: NSData) -> [Tweet]? {
        
        do{
            
            if let rootObject = try NSJSONSerialization.JSONObjectWithData(json, options: NSJSONReadingOptions.MutableContainers) as? [[String : AnyObject]] {
                
                var tweets = [Tweet]()
                
                for tweetObject in rootObject {
                    
                    if let text = tweetObject["text"] as? String, id = tweetObject["id_str"] as? String, user = tweetObject["user"] as? [String : AnyObject] {
                        
                        
                        let retweet = self.retweet(tweetObject)
                        
                        if retweet.0 == true {
                            
                            if let retweetObject = retweet.1 {
                                if let retweetText = retweetObject["text"] as? String, retweetUser = retweetObject["user"] as? [String : AnyObject] {
                                    if let retweetUser = userFromData(retweetUser), user = userFromData(user) {
                                        let tweet = Tweet(text: text, id: id, user: user, rqText: retweetText, rqUser: retweetUser, isRetweet: true)
                                        tweets.append(tweet)
                                    }
                                }
                            }
                        }
                        
                    }
                }
                return tweets
            }
        }
        catch _ {
            
            return nil
            
        }
        
        return nil;
    }
    
    class func retweet(tweetObject: [String : AnyObject]) -> (Bool, [String : AnyObject]?) {
        if let retweetObject = tweetObject["retweeted_status"] as? [String : AnyObject] {
            if retweetObject["text"] as? String != nil && retweetObject["user"] as? [String : AnyObject] != nil {
                return (true, retweetObject)
            }
        }
        return (false, nil)
    }
    
    class func userFromData(user: [String : AnyObject]) -> User? {
        if let name = user["name"] as? String, profileImageUrl = user["profile_image_url"] as? String {
            return User(username: name, profileImageUrl: profileImageUrl)
        }
        return nil
    }
}
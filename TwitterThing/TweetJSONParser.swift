import Foundation

class TweetJSONParser {

    class func tweetFromJSONData(json: NSData) -> [Tweet]? {
        
        do{
            
            if let rootObject = try NSJSONSerialization.JSONObjectWithData(json, options: NSJSONReadingOptions.MutableContainers) as? [[String : AnyObject]] {
                
                var tweets = [Tweet]()
                
                for tweetObject in rootObject {
                    
                    if let text = tweetObject["text"] as? String, id = tweetObject["id_str"] as? String, user = tweetObject["user"] as? [String : AnyObject] {
                        
                        let tweet = Tweet(text : text, id : id, user: nil)
                        
                        if let name = user["name"] as? String, profileImageURL = user["profile_image_url"] as? String {
                            tweet.user = User(username: name, profileImageUrl: profileImageURL)
                        }
                        
                        // Append newly created tweets
                        tweets.append(tweet)
                    }
                }
                return tweets
            }
        } catch _ {
            return nil
        }
        return nil;
    }
    
    class func userFromData(user: [String : AnyObject]) -> User? {
        if let name = user["name"] as? String, profileImageUrl = user["profile_image_url"] as? String {
            return User(username: name, profileImageUrl: profileImageUrl)
        }
        return nil
    }
}
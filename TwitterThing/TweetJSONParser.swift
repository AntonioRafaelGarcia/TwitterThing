import Foundation

class TweetJSONParser {                 //How's this work???
    class func tweetFromJSONData(json: NSData) -> [Tweet]? {
        
        do{
            
            if let rootObject = try NSJSONSerialization.JSONObjectWithData(json, options: NSJSONReadingOptions.MutableContainers) as? [[String : AnyObject]] {
                
                print(rootObject)
                
                var tweets = [Tweet]()
                
                for tweetObject in rootObject {
                    
                    if let text = tweetObject["text"] as? String, id = tweetObject["id_str"] as? String, user = tweetObject["user"] as? [String : AnyObject], name = user["name"] as? String, profileImageUrl = user["profile_image_url"] as? String {
                        
                        let tweet = Tweet(text: text, id: id, username: name, profileImageUrl: profileImageUrl)
                        tweets.append(tweet)
                    }
                }
                return tweets
            }
        } catch _ {}
        return nil
    }
}
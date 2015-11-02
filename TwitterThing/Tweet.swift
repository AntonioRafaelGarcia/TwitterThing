import Foundation

class Tweet {
    let text: String
    let id: String
    var user: User?
    
    let rqText: String?
    let rqUser: User?
    
    var isRetweet: Bool
    
    init(text: String, id: String, user: User?, rqText: String?, rqUser: User? = nil, isRetweet: Bool = false){
        self.text = text
        self.id = id
        self.user = user
        self.rqText = rqText
        self.rqUser = rqUser
        self.isRetweet = isRetweet
    }
}